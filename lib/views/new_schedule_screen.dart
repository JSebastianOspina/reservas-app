import 'package:flutter/material.dart';

class NewScheduleScreen extends StatelessWidget {
  const NewScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Agenda tu cita'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const _ScheduleScreenBody(),
    );
  }
}

class _ScheduleScreenBody extends StatefulWidget {
  const _ScheduleScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  State<_ScheduleScreenBody> createState() => _ScheduleScreenBodyState();
}

class _ScheduleScreenBodyState extends State<_ScheduleScreenBody> {
  late int selectedItem = DateTime.now().day;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(35),
              bottomLeft: Radius.circular(35),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SelectMonth(),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 85,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _getDateCards(selectedItem),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('Mañana'),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _TimeCard(hour: '09:00'),
                    _TimeCard(hour: '10:00'),
                    _TimeCard(hour: '11:00'),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text('Tarde'),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _TimeCard(hour: '13:00'),
                    _TimeCard(hour: '14:00'),
                    _TimeCard(hour: '15:00'),
                    _TimeCard(hour: '16:00'),
                    _TimeCard(hour: '17:00'),
                    _TimeCard(hour: '18:00'),
                    _TimeCard(hour: '19:00'),
                    _TimeCard(hour: '20:00'),
                  ],
                ),
              ),
            ],
          ),
        ),
        //ACA EMPIEZA LA PARTE INFERIOR
        const SizedBox(
          height: 5,
        ),

        const Expanded(
          child: _OrderDetails(),
        )
      ],
    );
  }

  List<GestureDetector> _getDateCards(index) {
    List<String> daysAsString = [
      'Lun',
      'Mar',
      'Mie',
      'Jue',
      'Vie',
      'Sab',
      'Dom'
    ];
    List<GestureDetector> dateCards = [];
    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    int initialWeekDay = now.weekday;

    int day = now.day;
    for (day; day <= daysInMonth; day++) {
      dateCards.add(_getDateCard(
        dayNumber: day,
        day: day.toString(),
        dayName: daysAsString[initialWeekDay - 1],
      ));
      if (initialWeekDay < 7) {
        initialWeekDay++;
      } else {
        initialWeekDay = 1;
      }
    }
    return dateCards;
  }

  _getDateCard({
    day,
    dayNumber,
    dayName,
  }) {
    return GestureDetector(
      onTap: () {
        print(dayNumber);
        setState(() {
          selectedItem = dayNumber;
        });
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: selectedItem == dayNumber ? Colors.grey[100] : Colors.white,
          ),
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Text(
                day,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                dayName,
                style: const TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.grey),
              )
            ],
          )),
    );
  }
}

class _OrderDetails extends StatelessWidget {
  const _OrderDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Detalles de tu cita',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _OrderDetailsCard(
                size: size,
                title: 'PROFESIONAL',
                value: 'Sara Valentina Cuy Ramirez',
              ),
              _OrderDetailsCard(
                size: size,
                title: 'RESERVA',
                value: '2:00 pm',
                subValue: 'Diciembre 27,2021',
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder?>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                      const EdgeInsets.all(15)),
                  backgroundColor:
                      MaterialStateProperty.all<Color?>(Colors.black)),
              onPressed: () => {},
              child: const Text(
                'CONFIRMAR CITA',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _OrderDetailsCard extends StatelessWidget {
  const _OrderDetailsCard(
      {Key? key,
      required this.size,
      required this.title,
      required this.value,
      this.subValue})
      : super(key: key);

  final Size size;
  final String title;
  final String value;
  final String? subValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (size.width / 2) - 30, //Leave 30 pixels for separation
      height: 120,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          subValue != null
              ? Text(
                  subValue!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                )
              : const SizedBox(
                  width: 0,
                  height: 0,
                )
        ],
      ),
    );
  }
}

class _TimeCard extends StatelessWidget {
  const _TimeCard({
    Key? key,
    required this.hour,
  }) : super(key: key);
  final hour;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade100, width: 1),
          top: BorderSide(color: Colors.grey.shade100, width: 1),
          right: BorderSide(color: Colors.grey.shade100, width: 1),
          left: BorderSide(color: Colors.grey.shade100, width: 1),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.all(15),
      child: Text(hour),
    );
  }
}

class _SelectMonth extends StatefulWidget {
  const _SelectMonth({
    Key? key,
  }) : super(key: key);

  @override
  State<_SelectMonth> createState() => _SelectMonthState();
}

class _SelectMonthState extends State<_SelectMonth> {
  String dropdownValue = _getActualMonth();
  final List<DropdownMenuItem<String>> monthListDropdownButtons =
      _generateAvaliableMonthsWidgets();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Programa tu cita',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border(
              bottom: BorderSide(color: Colors.grey[200]!),
              right: BorderSide(color: Colors.grey[200]!),
              left: BorderSide(color: Colors.grey[200]!),
              top: BorderSide(color: Colors.grey[200]!),
            ),
          ),
          child: DropdownButton<String>(
              underline: const SizedBox(
                height: 0,
              ),
              dropdownColor: Colors.white,
              isDense: true,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              value: dropdownValue,
              elevation: 1,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: [
                ...monthListDropdownButtons,
              ]),
        )
      ],
    );
  }

  static List<DropdownMenuItem<String>> _generateAvaliableMonthsWidgets() {
    final List<String> monthList = _getAvaliableMonths();

    List<DropdownMenuItem<String>> monthsWidgetsArray = [];
    for (var month in monthList) {
      monthsWidgetsArray.add(DropdownMenuItem(
        child: Text(month),
        value: month,
      ));
    }
    return monthsWidgetsArray;
  }

  static const List<String> months = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];

  static String _getActualMonth() {
    final monthNumber = _getActualMonthNumber();
    return months[monthNumber];
  }

  static int _getActualMonthNumber() {
    final now = DateTime.now();
    return now.month - 1;
  }

  static List<String> _getAvaliableMonths() {
    List<String> avaliableMonths = [];
    int month = _getActualMonthNumber();
    for (month; month <= months.length - 1; month++) {
      avaliableMonths.add(months[month]);
    }
    return avaliableMonths;
  }
}
