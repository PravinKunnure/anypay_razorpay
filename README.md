# AnyPay Razorpay Adapter

[![Pub Version](https://img.shields.io/pub/v/anypay_razorpay)](https://pub.dev/packages/anypay_razorpay) | [![License: MIT](https://img.shields.io/badge/license-MIT-green)](https://opensource.org/licenses/MIT)

**anypay_razorpay** is a **Razorpay adapter for the AnyPay Flutter plugin**.  
It allows developers to integrate Razorpay payments using the **unified AnyPay API**, while keeping UI fully under the developer's control.

---

## Features

- Unified API through AnyPay: `AnyPay.charge()`
- Adapter-based Razorpay integration
- Handles payment statuses:
    - `success`
    - `failed`
    - `pending`
    - `error`
- No forced UI – developer decides how to display payment results
- Lightweight and easy to integrate

---

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  anypay_razorpay: <latest_version>