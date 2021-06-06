import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No transactions added yet.',
                style: Theme.of(context).textTheme.headline6,
              ),
              Image.asset(
                'images/empty.png',
                fit: BoxFit.cover,
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                height: 70.0,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Card(
                  elevation: 2.0,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child: CircleAvatar(
                            child: Icon(Icons.shopping_bag),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\₹${transactions[index].amount.toString()}',
                              // style: Theme.of(context).textTheme.headline6,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              transactions[index].title,
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Text(''),
                        ),
                        Row(
                          children: [
                            Text(
                              DateFormat.yMMMd()
                                  .format(transactions[index].date),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () => deleteTx(transactions[index].id),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}

// return Container(
//           height: 70.0,
//           margin: EdgeInsets.symmetric(horizontal: 5.0),
//           child: Card(
//             child: Container(
//               padding: EdgeInsets.all(10.0),
//               child: Row(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(right: 10.0),
//                     child: CircleAvatar(
//                       child: Icon(Icons.shopping_bag),
//                     ),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '\₹${tx.amount.toString()}',
//                         style: TextStyle(
//                             fontSize: 16.0, fontWeight: FontWeight.w500),
//                       ),
//                       Text(
//                         tx.title,
//                         style: TextStyle(fontSize: 15.0),
//                       ),
//                     ],
//                   ),
//                   Expanded(
//                     child: Text(''),
//                   ),
//                   Text(
//                     DateFormat.yMMMd().format(tx.date),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
