<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f4f4f4;
	    
        }
        .payment-form {
	    margin-top:25%;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            widht:500px;
        }
        h1 {
            text-align: center;
            color: #2c3e50;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .payment-methods {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
        }
        .payment-method {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 10px;
            text-align: center;
            cursor: pointer;
        }
        .payment-method:hover {
            background-color: #f0f0f0;
        }
        input[type="radio"] {
            display: none;
        }
        input[type="radio"]:checked + label {
            background-color: #3498db;
            color: #fff;
            border-color: #3498db;
        }
        .submit-btn {
            background-color: #2ecc71;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 25%;
            font-size: 16px;
	    margin-left:38%;
        }
        .submit-btn:hover {
            background-color: #27ae60;
        }
        .dynamic-form {
            margin-top: 20px;
        }
        .upi-options {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
        }
        .upi-option {
            background-color: #f0f0f0;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 10px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .upi-option:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <div class="payment-form">
        <h1>Payment Details</h1>
        <form>
            <div class="form-group">
                <p style="text-align:center; font-size:1.5em;">Amount: 300/-</p>
                
            </div>
            <div class="form-group">
                <label>Select Payment Method</label>
                <div class="payment-methods">
                    <input type="radio" id="credit-card" name="payment-method" value="credit-card" required>
                    <label for="credit-card" class="payment-method">
                        Credit Card
                    </label>
                    <input type="radio" id="debit-card" name="payment-method" value="debit-card">
                    <label for="debit-card" class="payment-method">
                        Debit Card
                    </label>
                    <input type="radio" id="net-banking" name="payment-method" value="net-banking">
                    <label for="net-banking" class="payment-method">
                        Internet Banking
                    </label>
                    <input type="radio" id="upi" name="payment-method" value="upi">
                    <label for="upi" class="payment-method">
                        UPI
                    </label>
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="submit-btn">Proceed to Pay</button>
            </div>
        </form>
    </div>
    <script>
        const paymentMethods = document.querySelectorAll('input[name="payment-method"]');
        const formContainer = document.createElement('div');
        formContainer.className = 'dynamic-form';
        document.querySelector('.payment-form form').insertBefore(formContainer, document.querySelector('.submit-btn').parentNode);

        paymentMethods.forEach(method => {
            method.addEventListener('change', function() {
                formContainer.innerHTML = '';
                switch(this.value) {
                    case 'credit-card':
                    case 'debit-card':
                        formContainer.innerHTML = `
                            <div class="form-group">
                                <label for="card-number">Card Number</label>
                                <input type="text" id="card-number" name="card-number" required>
                            </div>
                            <div class="form-group">
                                <label for="cvv">CVV</label>
                                <input type="text" id="cvv" name="cvv" required maxlength="3">
                            </div>
                            <div class="form-group">
                                <label for="otp">OTP</label>
                                <input type="text" id="otp" name="otp" required>
                            </div>
                        `;
                        break;
                    case 'net-banking':
                        formContainer.innerHTML = `
                            <div class="form-group">
                                <label for="bank-name">Bank Name</label>
                                <select id="bank-name" name="bank-name" required>
                                    <option value="">Select your bank</option>
                                    <option value="sbi">State Bank of India</option>
                                    <option value="hdfc">HDFC Bank</option>
                                    <option value="icici">ICICI Bank</option>
                                    <option value="axis">Axis Bank</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="account-number">Account Number</label>
                                <input type="text" id="account-number" name="account-number" required>
                            </div>
                        `;
                        break;
                    case 'upi':
                        formContainer.innerHTML = `
                            <div class="form-group">
                                <label>Choose UPI App</label>
                                <div class="upi-options">
                                    <button type="button" class="upi-option">Google Pay</button>
                                    <button type="button" class="upi-option">Paytm</button>
                                    <button type="button" class="upi-option">PhonePe</button>
                                    <button type="button" class="upi-option">BHIM</button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="upi-id">UPI ID</label>
                                <input type="text" id="upi-id" name="upi-id" placeholder="yourname@upi" required>
                            </div>
                        `;
                        break;
                }
            });
        });
    </script>
</body>
</html>