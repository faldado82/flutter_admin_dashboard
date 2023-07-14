import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/ui/cards/white_card.dart';
import 'package:flutter_admin_dashboard/ui/labels/custom_labels.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Icons View', style: CustomLabels.h1),
          const SizedBox(height: 30),
          const WhiteCard(
            title: 'This is my Icons Collection',
            child: Text('A collection of icons to use every day I work'),
          ),
          const Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                width: 170,
                title: 'ac_unit_outlined',
                child: Center(child: Icon(Icons.ac_unit_outlined)),
              ),
              WhiteCard(
                width: 170,
                title: 'access_alarm_outlined',
                child: Center(child: Icon(Icons.access_alarm_outlined)),
              ),
              WhiteCard(
                width: 170,
                title: 'blender_outlined',
                child: Center(child: Icon(Icons.blender_outlined)),
              ),
              WhiteCard(
                width: 170,
                title: 'gradient_outlined',
                child: Center(child: Icon(Icons.gradient_outlined)),
              ),
              WhiteCard(
                width: 170,
                title: 'pedal_bike_outlined',
                child: Center(child: Icon(Icons.pedal_bike_outlined)),
              ),
              WhiteCard(
                width: 170,
                title: 'dangerous_outlined',
                child: Center(child: Icon(Icons.dangerous_outlined)),
              ),
              WhiteCard(
                width: 170,
                title: 'radar_rounded',
                child: Center(child: Icon(Icons.radar_rounded)),
              ),
              WhiteCard(
                width: 170,
                title: 'verified',
                child: Center(child: Icon(Icons.verified)),
              ),
              WhiteCard(
                width: 170,
                title: 'featured_play_list',
                child: Center(child: Icon(Icons.featured_play_list)),
              ),
              WhiteCard(
                width: 170,
                title: 'data_exploration',
                child: Center(child: Icon(Icons.data_exploration)),
              ),
              WhiteCard(
                width: 170,
                title: 'telegram',
                child: Center(child: Icon(Icons.telegram)),
              ),
              WhiteCard(
                width: 170,
                title: 'facebook',
                child: Center(child: Icon(Icons.facebook)),
              ),
              WhiteCard(
                width: 170,
                title: 'watch_later_sharp',
                child: Center(child: Icon(Icons.watch_later_sharp)),
              ),
              WhiteCard(
                width: 170,
                title: 'edgesensor_high',
                child: Center(child: Icon(Icons.edgesensor_high)),
              ),
              WhiteCard(
                width: 170,
                title: 'safety_check',
                child: Center(child: Icon(Icons.safety_check)),
              ),
              WhiteCard(
                width: 170,
                title: 'nat_outlined',
                child: Center(child: Icon(Icons.nat_outlined)),
              ),
              WhiteCard(
                width: 170,
                title: 'label_important_outline',
                child: Center(child: Icon(Icons.label_important_outline)),
              ),
              WhiteCard(
                width: 170,
                title: 'wallet',
                child: Center(child: Icon(Icons.wallet)),
              ),
              WhiteCard(
                width: 170,
                title: 'qr_code_2_outlined',
                child: Center(child: Icon(Icons.qr_code_2_outlined)),
              ),
              WhiteCard(
                width: 170,
                title: 'traffic_sharp',
                child: Center(child: Icon(Icons.traffic_sharp)),
              ),
              WhiteCard(
                width: 170,
                title: 'ice_skating',
                child: Center(child: Icon(Icons.ice_skating)),
              ),
              WhiteCard(
                width: 170,
                title: 'pending_actions_rounded',
                child: Center(child: Icon(Icons.pending_actions_rounded)),
              ),
              WhiteCard(
                width: 170,
                title: 'offline_bolt',
                child: Center(child: Icon(Icons.offline_bolt)),
              ),
              WhiteCard(
                width: 170,
                title: 'insert_photo_rounded',
                child: Center(child: Icon(Icons.insert_photo_rounded)),
              ),
              WhiteCard(
                width: 170,
                title: 'assessment_sharp',
                child: Center(child: Icon(Icons.assessment_sharp)),
              ),
              WhiteCard(
                width: 170,
                title: 'gps_fixed',
                child: Center(child: Icon(Icons.gps_fixed)),
              ),
              WhiteCard(
                width: 170,
                title: 'handyman_sharp',
                child: Center(child: Icon(Icons.handyman_sharp)),
              ),
              WhiteCard(
                width: 170,
                title: 'add_ic_call_outlined',
                child: Center(child: Icon(Icons.add_ic_call_outlined)),
              ),
              WhiteCard(
                width: 170,
                title: 'radio_button_checked_outlined',
                child: Center(child: Icon(Icons.radio_button_checked_outlined)),
              ),
              WhiteCard(
                width: 170,
                title: 'gamepad',
                child: Center(child: Icon(Icons.gamepad)),
              ),
              WhiteCard(
                width: 170,
                title: 'real_estate_agent_outlined',
                child: Center(child: Icon(Icons.real_estate_agent_outlined)),
              ),
              WhiteCard(
                width: 170,
                title: 'vertical_distribute_outlined',
                child: Center(child: Icon(Icons.vertical_distribute_outlined)),
              ),
              WhiteCard(
                width: 170,
                title: 'assessment',
                child: Center(child: Icon(Icons.assessment)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
