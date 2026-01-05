"""
Streamlit Application Example
Run with: streamlit run app.py
"""
import streamlit as st
import pandas as pd
import numpy as np

st.set_page_config(
    page_title="Python Basic App",
    page_icon="🐍",
    layout="wide"
)

st.title("🐍 Python Basic Template")
st.markdown("---")

# Package versions
col1, col2, col3 = st.columns(3)
with col1:
    st.metric("Pandas", pd.__version__)
with col2:
    st.metric("NumPy", np.__version__)
with col3:
    st.metric("Streamlit", st.__version__)

st.markdown("---")

# Sample data
st.subheader("Sample DataFrame")
df = pd.DataFrame({
    "Name": ["Alice", "Bob", "Charlie", "Diana"],
    "Age": [25, 30, 35, 28],
    "Score": np.random.randint(60, 100, 4)
})
st.dataframe(df, use_container_width=True)

# Chart
st.subheader("Sample Chart")
chart_data = pd.DataFrame(
    np.random.randn(20, 3),
    columns=["A", "B", "C"]
)
st.line_chart(chart_data)

st.markdown("---")
st.caption("Python Basic Template - Ready for development!")
