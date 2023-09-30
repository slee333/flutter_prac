import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String currencyName, currencyAcronym, amount;
  final IconData currencyIcon;
  final bool isDark;

  const CurrencyCard({
    super.key,
    required this.currencyName,
    required this.currencyAcronym,
    required this.amount,
    required this.currencyIcon,
    this.isDark = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: isDark ? Colors.grey.shade600 : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black45)),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currencyName,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    amount,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    currencyAcronym,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
          Transform.scale(
            scale: 3,
            child: Transform.translate(
              offset: const Offset(-3, 8),
              child: Icon(
                currencyIcon,
                color: isDark ? Colors.white : Colors.black,
                size: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
