import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

class SmsReader extends StatefulWidget{
  @override
  _SmsReaderState createState() => _SmsReaderState();
}

class _SmsReaderState extends State<SmsReader> {
  final Telephony telephony = Telephony.instance;
  List<SmsMessage> messages = [];

  @override
  void initState(){
    super.initState();
    readSms();
  }

  void readSms() async{
    bool? permisssionsGranted = await telephony.requestSmsPermissions;
    if (permisssionsGranted!){
      List<SmsMessage> smsMessages = await telephony.getInboxSms(
        filter: SmsFilter.where(SmsColumn.ADDRESS).equals("BANK"),
        sortOrder: [OrderBy(SmsColumn.DATE, sort: Sort.DESC)],
      );
      setState(() {
        messages = smsMessages;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView.builder(itemCount:messages.length, 
      itemBuilder: (context, index){
        return ListTile(
          title: Text(messages[index].body ?? ""),
          subtitle: Text(messages[index].address ?? ""),
        );
      },),
    );
  }
}