import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses/models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransactions;

  Chart(this._recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < _recentTransactions.length; i++) {
        bool sameDay = _recentTransactions[i].date.day == weekDay.day;
        bool sameMonth = _recentTransactions[i].date.month == weekDay.month;
        bool sameYear = _recentTransactions[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += _recentTransactions[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + (item['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactions.map((tr) {
              return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    label: tr['day'],
                    value: tr['value'],
                    percentage: _weekTotalValue == 0
                        ? 0
                        : (tr['value'] as double) / _weekTotalValue,
                  ));
            }).toList(),
          ),
        ));
  }
}
