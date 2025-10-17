# Movie Analytics Dashboard

Movie Analytics Dashboard is an interactive analytics and visualization project developed as a university assignment. The dashboard is implemented in Microsoft Power BI and the Power BI report file (.pbix) included in this repository already contains the preprocessed data required to run and explore the report — you do not need to run any ETL to view the visuals.

What I changed: I wrote a README that reflects the project being a university assignment, clarifies that the PBIX contains the preprocessed data, and documents the preprocessing tools (R and Jupyter) used to produce the dataset in case you want to reproduce or modify it. What I can do next: I can commit this README to the repository for you or tailor any section (exact PBIX filename, course details, screenshots) when you give me those specifics.

## Highlights
- Power BI report (.pbix) with interactive visuals: time-series, distributions, scatter plots, geographic maps, and relationship/network-style views.
- Slicers and drill-through capability by year, genre, country, language, rating, revenue ranges, and more.
- Preprocessed data is embedded in the PBIX file — the report is ready-to-open and explore.
- Data preprocessing and feature engineering were performed using R scripts and Jupyter notebooks; those artifacts are included for reproducibility.

## University Project
- Type: University coursework
- Course: Data Analysis
- Deliverables: PBIX file (or exported PDF).

## Tech stack
- Dashboard: Microsoft Power BI Desktop (.pbix) and (optional) Power BI Service for sharing.
- Data preprocessing: R (scripts / RMarkdown) and Jupyter notebooks.
- Typical R packages used (example): tidyverse, lubridate, janitor, readr, arrow.
- Data sources: CSV, Kaggle datasets.

## Quick start — open the report (no ETL required)
Prerequisites:
- Power BI Desktop (free) to open and edit the .pbix file.
- Power BI account (Power BI Pro recommended) to publish or share to Power BI Service.

Steps:
1. Clone the repository:
   git clone https://github.com/Rw-Khalil/Movie-Analytics-Dashboard.git
   cd Movie-Analytics-Dashboard

2. Locate the Power BI report file:
   - Look in the `reports/` directory for the PBIX file (e.g., `reports/Movie_Analytics_Dashboard.pbix`).
   - If the PBIX filename differs, use the name present in the `reports/` folder.

3. Open the PBIX:
   - Double-click the PBIX or open it from Power BI Desktop (File → Open).
   - The visuals are ready to be explored because the preprocessed data is embedded in the report.

4. Explore and export:
   - Use slicers, cross-filtering, and drill-through to explore insights.
   - Export pages to PDF or PowerPoint from Desktop or Service for sharing.

## If you want to reproduce or update the data
Although the PBIX contains the preprocessed data, the repository includes the preprocessing artifacts to reproduce or update the dataset:

- R scripts (e.g., `scripts/ingest_data.R`, `scripts/build_features.R`) — run with R or Rscript.
  Example:
  Rscript scripts/ingest_data.R --input data/raw --output data/processed

- Jupyter notebooks (in `notebooks/`) — open with JupyterLab/Notebook and re-run cells to reproduce exploratory analyses and data transformations.

After regenerating processed data:
- Option A — Replace data used by the PBIX:
  - In Power BI Desktop: Home → Transform data → Data source settings / Edit Queries to point to the new files or folder.
  - Refresh the report to pick up the updated dataset.
- Option B — Regenerate the PBIX:
  - If you prefer a fresh PBIX, open the included PBIX, update the data source references, and save as a new PBIX.

Notes on scheduled refresh:
- If you publish to Power BI Service and want automated refreshes, store processed data in a cloud location (Azure Blob, OneDrive, etc.) or configure an on-premises Power BI Gateway.

## Acknowledgements
Thanks to dataset providers (Kaggle, TMDb, IMDb) and the R/Jupyter/Power BI ecosystems used while preparing and presenting the analysis.

Contact
- Maintainer: Rw-Khalil
- GitHub: https://github.com/Rw-Khalil
