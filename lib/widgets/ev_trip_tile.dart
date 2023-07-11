import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../services/item_bloc.dart';

class EvTripTile extends StatelessWidget {
  const EvTripTile({
    super.key,
    required this.bloc,
  });

  final ItemBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(bloc.item.id),
      background: Container(color: Colors.red),
      onDismissed: (direction) => bloc.delete(),
      child: ListTile(
        title: Text(
          'Total trip cost ${bloc.item.totalCost.toStringAsFixed(3)} USD for ${bloc.item.distanceMiles.toStringAsFixed(2)} Miles',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              color: kblack15161810,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        subtitle: Text(
          '${bloc.item.countryChargingStation} 1 Kilowatt hour Costs ${bloc.item.oneKWhPrice} USD',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              color: kblack15161810,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        leading: const Icon(
          Icons.add_road,
          color: kblue9813424010,
        ),
        onTap: () {},
      ),
    );
  }
}
