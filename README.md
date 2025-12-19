# Apple-Quality-Grading-Matlab

# Apple Quality Grading Using Image Processing (MATLAB)

## Overview

This project presents a **MATLAB-based image processing approach for automatic apple quality grading**. The goal is to classify apples into quality categories based on **visual characteristics such as color, size, and surface features** extracted from digital images.

The system demonstrates how classical image processing techniques can be applied to **agricultural product inspection and quality control** without relying on complex machine learning models.

---

## Problem Description

Manual inspection of agricultural products is time-consuming, subjective, and prone to human error. Automated grading systems can improve **consistency, speed, and accuracy** in quality assessment.

In this project, apple images are processed to extract meaningful features that can be used to **grade apple quality automatically**.

---

## Methodology

The grading process consists of the following steps:

### 1. Image Acquisition

* Input images of apples are loaded into MATLAB.
* Images are resized and converted to appropriate color spaces.

---

### 2. Preprocessing

* Noise reduction and smoothing
* Conversion from RGB to grayscale (when required)
* Contrast enhancement

---

### 3. Feature Extraction

The following features are extracted from each apple image:

* **Color features** (intensity and channel information)
* **Geometric features** (area, shape, size)
* **Surface characteristics** (defects, irregularities)

These features are used as indicators of apple quality.

---

### 4. Quality Grading Logic

A **rule-based decision logic** is applied to classify apples into quality categories such as:

* High quality
* Medium quality
* Low quality

The grading rules are based on threshold values derived from the extracted features.

---

## Results

The system successfully classifies apples based on their visual properties. The results demonstrate that classical image processing techniques can provide reliable quality grading for controlled image conditions.

Sample outputs include:

* Processed apple images
* Feature visualization
* Final quality classification results

---

## Implementation Details

* Language: **MATLAB**
* Techniques used:

  * Image preprocessing
  * Feature extraction
  * Threshold-based classification
* No external toolboxes are required beyond standard MATLAB image processing functions.
