import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tttt/config/constants.dart';
import 'package:tttt/modules/reqest.dart';


class RequestCard extends StatelessWidget {
  final f = new DateFormat('dd-MM-yyyy  hh:mm');
  Request request;
  RequestCard({@required this.request});

  @override
  Widget build(BuildContext context) {
    print("request.state ${request.state}");
    return Container(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          //color: Theme.of(context).accentColor,
          color: Colors.teal,
          elevation: 3,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5.0),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    '${convertStateCodeToTitle(request.state)}',
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0))),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Request Date: "),
                        Text(
                          f.format(request.timestamp.toDate()),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Device",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              '${request.deviceName}',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.body1,
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Department",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              '${request.departmentName}',
                              style: Theme.of(context).textTheme.body1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    if(request.message.isNotEmpty)
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Description: ',
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            '${request.message}',
                            style: Theme.of(context).textTheme.body1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
  static convertStateCodeToTitle(String code){
    return status.containsKey(code)?status[code]:"UNKNOWN";
  }
}
