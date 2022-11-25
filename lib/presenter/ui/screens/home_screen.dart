import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hotel_app_ui/domain/model/hotel_model.dart';
import 'package:flutter_hotel_app_ui/domain/repository/hotel_repository.dart';
import 'package:flutter_hotel_app_ui/gen/assets.gen.dart';
import 'package:flutter_hotel_app_ui/gen/colors.gen.dart';
import 'package:flutter_hotel_app_ui/presenter/ui/widgets/app_button.dart';
import 'package:flutter_hotel_app_ui/presenter/ui/widgets/app_icon_container_widget.dart';
import 'package:flutter_hotel_app_ui/presenter/ui/widgets/hotel_card_widget.dart';
import 'package:flutter_hotel_app_ui/presenter/ui/widgets/label_input_widget.dart';
import 'package:flutter_hotel_app_ui/utilities/constanst.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: double.infinity,
          margin: EdgeInsets.only(top: size.height / 4),
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24, top: 16),
          child: Column(
            children: const [
              SizedBox(height: 16),
              _HeaderSection(),
              SearchCard(),
              SizedBox(height: 24),
              Flexible(child: NearbyHotelSection()),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: Assets.image.photo.provider(),
            ),
            AppIconContainer(Assets.icon.notification.svg(height: 25)),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 24.0, bottom: 10, left: 4),
          child: Text(
            'Welcome back 👋',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class SearchCard extends HookWidget {
  const SearchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationTextController = useTextEditingController();
    final dateFromTextController = useTextEditingController();
    final dateToTextController = useTextEditingController();
    locationTextController.text = 'Yogyakarta';
    dateFromTextController.text =
        dateToTextController.text = dmyDateFormat.format(DateTime.now());

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Assets.icon.location.svg(color: ColorName.blue),
                const SizedBox(width: 16),
                Flexible(
                    child: LabelInputTextWidget(
                  label: 'Where',
                  controller: locationTextController,
                )),
              ],
            ),
            Row(
              children: [
                Assets.icon.calendar.svg(color: ColorName.blue),
                const SizedBox(width: 16),
                Flexible(
                    child: LabelInputTextWidget(
                  label: 'From',
                  controller: dateFromTextController,
                )),
                Flexible(
                    child: LabelInputTextWidget(
                  label: 'to',
                  controller: dateToTextController,
                )),
              ],
            ),
            const SizedBox(height: 16),
            AppButton(
              buttonText: 'Search',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class NearbyHotelSection extends ConsumerWidget {
  const NearbyHotelSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotelRepo = ref.watch(hotelRepositoryProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Nearby hotels',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              'See all',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: ColorName.blue),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Flexible(
          child: FutureBuilder<List<HotelModel>>(
              future: hotelRepo.getHotelList(),
              builder: (context, snapshot) {
                final listHotel = snapshot.data;
                if (listHotel == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    itemCount: listHotel.length,
                    itemBuilder: (context, index) {
                      final hotel = listHotel[index];
                      return HotelCardWidget(hotelModel: hotel);
                    });
              }),
        )
      ],
    );
  }
}
