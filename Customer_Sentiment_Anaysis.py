import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import plotly.express as px
from collections import Counter

# Load Excel Dataset
file_path = "TAsk1FutureIntern.xlsx"  
try:
    df = pd.read_excel(file_path, engine="openpyxl")
    print("Excel file loaded successfully!")
except Exception as e:
    print(f"Error loading file: {e}")
    exit()  # Stop execution if file fails to load

#Checks whether cols exist
required_cols = ["Sentiment", "Timestamp", "Likes", "Retweets", "Platform", "Hashtags", "Year", "Month", "Day"]
missing_cols = [col for col in required_cols if col not in df.columns]
if missing_cols:
    print(f"Error: Missing columns {missing_cols}")
    exit()

#Convert Month Numbers to Names
df["Month Name"] = pd.to_datetime(df[["Year", "Month", "Day"]], errors="coerce").dt.strftime("%b")

#Sentiment Distribution (Bar Chart)
plt.figure(figsize=(8,5))
sns.countplot(x="Sentiment", data=df, palette="coolwarm")
plt.title("Sentiment Distribution")
plt.xlabel("Sentiment Type")
plt.ylabel("Count")
plt.show(block=False)  # Non-blocking mode

#Engagement Trends Over Time (Line Plot)
df["Timestamp"] = pd.to_datetime(df["Timestamp"], errors="coerce")
df["Month_Year"] = df["Timestamp"].dt.strftime("%Y-%m")  # Converts Period to string
engagement_trends = df.groupby("Month_Year")[["Likes", "Retweets"]].sum().reset_index()
fig = px.line(engagement_trends, x="Month_Year", y=["Likes", "Retweets"],
              labels={"value": "Engagement Count", "Month_Year": "Month-Year"},
              title="Engagement Trends Over Time")
fig.show()
#Platform-Based Likes Distribution (Box Plot)
plt.figure(figsize=(10,6))
sns.boxplot(x="Platform", y="Likes", data=df, palette="Set2")
plt.title("Likes Across Platforms")
plt.xlabel("Social Media Platform")
plt.ylabel("Likes Count")
plt.xticks(rotation=45)
plt.show(block=False)  # Non-blocking mode

#Top 10 Hashtag Frequency Analysis (Bar Chart)
df["Hashtags"] = df["Hashtags"].fillna("")  # Handle missing values safely
all_hashtags = df["Hashtags"].apply(lambda x: x.split() if isinstance(x, str) else [])  # Prevent errors with `.str.split()`
flat_list = [tag.lower() for sublist in all_hashtags for tag in sublist]
top_hashtags = Counter(flat_list).most_common(10)
hashtag_df = pd.DataFrame(top_hashtags, columns=["Hashtag", "Count"])
fig = px.bar(hashtag_df, x="Hashtag", y="Count", title="Top 10 Hashtags")
fig.show()

#Prevent Instant Closure
input("Press Enter to exit...")  # Ensures all plots remain visible
