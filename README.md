# Manual Backtesting Tool for MT5

A **streamlined manual trading interface** for **MetaTrader 5 Strategy Tester**, designed to help discretionary traders validate their strategies on historical data without bias or self-deception.

This tool enables realistic manual backtesting by providing a clean, functional interface that simulates live trading conditions while leveraging MT5's comprehensive performance metrics and realistic market simulation.

---

## ✨ Why This Tool Exists

### The Problem with Discretionary Trading Validation

Manual traders face a critical challenge: **how to objectively test their strategies without hindsight bias**.

**Common pitfalls:**

* Looking at historical charts already knowing what happened
* Cherry-picking winning examples and ignoring losses
* Inability to track real performance metrics
* Self-deception about strategy effectiveness
* No way to measure risk-adjusted returns

**The Solution:**
MT5 Strategy Tester provides a **controlled environment** where you can:

* Trade on historical data **as if it were live**
* Progress bar-by-bar without seeing the future
* Get **unbiased performance metrics** (Win Rate, Profit Factor, Drawdown, etc.)
* Simulate realistic conditions (spread, slippage, commissions)
* Build confidence in your strategy with **real data**

This tool gives you a simple, fast interface to execute trades during manual backtesting, removing friction while maintaining the discipline needed for honest strategy validation.

---

## 🎯 Core Features

### 📊 Manual Backtesting in MT5 Strategy Tester

The primary use case - test your discretionary strategies honestly:

* **Bar-by-bar progression**
* **No future information**
* **Realistic execution** with spread, slippage, and commissions
* **Full MT5 metrics**: Profit Factor, Sharpe Ratio, Drawdown, Recovery Factor, etc.
* **Visual mode support**
* **Detailed report generation**

---

### ⚡ Simple, Fast Execution

* **One-click trading** (BUY/SELL)
* **Quick lot adjustment** with +/- buttons
* **Emergency close** all positions with one click
* **Audio feedback** for confirmations
* **Real-time P/L** monitoring

---

### 📈 Essential Position Management

* **Live position counter**
* **Continuous profit/loss display**
* **Color-coded feedback**
* **Lot size presets** with safety limits

---

### 🎨 Customizable Appearance

* Fully configurable colors
* Professional defaults included
* Dark, light, and custom themes

---

## 📦 Installation

1. **Download** `Elegant_Trader.txt`
2. **Open MetaEditor** in MT5
3. **Create new Expert Advisor** named `Elegant_Trader`
4. **Paste the code** from `Elegant_Trader.txt`
5. **Compile** with F7 (no errors expected)
6. **Attach EA to chart** in MT5 and enable AutoTrading

---

## 🚀 Usage

1. Adjust **lot size** with +/-
2. Execute **BUY/SELL** with one click
3. Monitor **open positions** and **P/L** in real time
4. Close all with **⊗ C L O S E  A L L**

Optimized both for **backtesting** in Strategy Tester and **discretionary live execution**.

---

## ⚙️ Configuration

### Inputs

```mql5
init_lot = 0.01     
lot_step = 0.01     
max_lot = 1.00      
trade_comment = "Elegant Trade"  
```

### Colors

```mql5
clr_Background = C'15,15,20'
clr_BuyButton = C'46,204,113'
clr_SellButton = C'231,76,60'
clr_NeutralButton = C'52,73,94'
clr_TextLight = C'236,240,241'
clr_Accent = C'241,196,15'
```

---

## 🎯 Primary Use Cases

* **Manual Strategy Backtesting**
* **Strategy Development & Refinement**
* **Trading Education & Practice**
* **Live Trading (secondary)**

---

## 📚 How Manual Backtesting Works in MT5

Use Strategy Tester (Ctrl+R), enable **visual mode**, and execute trades with the EA while MT5 generates a complete performance report.

Benefits include **realistic simulation**, **comprehensive metrics**, and **honest evaluation** without hindsight bias.

---

## 💡 Why Manual Backtesting Matters

Backtesting reveals:

* True win rate and risk/reward
* Drawdowns and losing streaks
* Market conditions best suited for strategy
* Weaknesses to address before going live

---

## 🔧 Technical Details

* **Language:** MQL5
* **Libraries:** CTrade
* **Architecture:** Event-driven, OOP
* **Performance:** Lightweight, responsive, no memory leaks

---

## ⚠️ Important Notes

* Designed **primarily for manual backtesting**
* Works for live trading but requires manual risk management
* No automated SL/TP

---

## 🛠️ Troubleshooting

* Ensure AutoTrading is enabled
* Check sufficient account margin
* Adjust interface position in code if overlapping chart

---

## 🚧 Known Limitations

* MT5 only
* Single-symbol operation
* Manual monitoring required

---

## 📜 License

Distributed under the **MIT License** — free to use, modify, and share with proper attribution.

---

## 👤 Author

**Nicola Chimenti**
Business Analyst & MQL Developer

🌐 [MQL5 Profile](https://www.mql5.com/it/users/teknotrader)
🔗 [LinkedIn](https://www.linkedin.com/in/nicolachimenti)
💻 [GitHub](https://github.com/TeknoTrader)
📧 Email: [nicola.chimenti.work@gmail.com](mailto:assistenza@nicolachimenti.com)

---

## 🙏 Acknowledgments

This project was developed to provide traders with a clean, efficient manual trading interface that prioritizes speed and elegance over feature bloat.

**Philosophy:**

> "Perfection is achieved not when there is nothing more to add,
> but when there is nothing left to take away."
> — Antoine de Saint-Exupéry

**Special Thanks:**

* The MQL5 community for excellent documentation
* Traders who value simplicity and speed
* Inspiration from [Andrey Voytenko’s MQL5 article](https://www.mql5.com/en/articles/17751), which explores and gives a detailed and strong example of approaches to manual trading dashboards in MT5: I wouldn't have done this without your article!

---

## 💬 Feedback & Contributions

* ⭐ Star the repo
* 🐛 Report issues
* 💡 Suggest improvements
* 🔀 Submit PRs
* 📢 Share with other traders

---

## 📚 Additional Resources

* [MQL5 Documentation](https://www.mql5.com/en/docs)
* [MQL5 Forum](https://www.mql5.com/en/forum)
* [MetaTrader 5 Help](https://www.metatrader5.com/en/terminal/help)

---

## 🎯 Roadmap

* v1.1: Optional SL/TP, keyboard shortcuts, interface presets
* v1.2: Trade history display, P/L tracker, risk calculator
* v2.0: Multi-symbol panel, advanced order types, cloud sync

---

⭐ **If you find this tool helpful, please star the repository — it helps others discover it!**

---

**VAT Code**: 02674000464
**Company**: Tekno Trader
**© 2025 Nicola Chimenti. All rights reserved.**

---

Vuoi che inserisca un **banner iniziale** tipo “Inspired by the MQL5 community” subito dopo il titolo, così il credito è visibile già in apertura, o preferisci che rimanga solo nella parte finale più discreta?
