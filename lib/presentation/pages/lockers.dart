import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locker/data/constants/assets.dart';
import 'package:locker/data/constants/colors.dart';
import 'package:locker/data/constants/translations.dart';
import 'package:locker/domain/state/mainbloc/main_bloc.dart';
import 'package:locker/domain/state/mainbloc/main_state.dart';
import 'package:locker/presentation/widgets/custom_button.dart';
import 'package:locker/presentation/widgets/item_locker.dart';
import 'package:locker/presentation/widgets/loader.dart';

class LockersPage extends StatelessWidget {
  const LockersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundHeader,
      body: SafeArea(
        child: BlocBuilder<MainBloc, MainBlocState>(
          buildWhen: (previous, current) {
            if (current is LoadLockerState || current is LoadingLockersState) {
              return true;
            }
            return false;
          },
          builder: (context, snapshot) {
            final lockers = BlocProvider.of<MainBloc>(context).lockers;
            final isLoading = BlocProvider.of<MainBloc>(context).isLoading;
            return Column(
              children: [
                SizedBox(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      children: [
                        SvgPicture.asset(AssetsSvg.logo),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 22,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Translations.locker,
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SvgPicture.asset(AssetsSvg.exit),
                            ],
                          ),
                        ),
                        isLoading
                            ? const Center(
                                child: CustomLoader(),
                              )
                            : Expanded(
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          itemCount: lockers.length,
                                          itemBuilder: (ctx, index) {
                                            return ItemLocker(
                                              locker: lockers[index],
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 30),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 25,
                                          ),
                                          child: CustomButton(
                                            title: Translations.addLocker,
                                            onTap: () {},
                                          ),
                                        ),
                                        const SizedBox(height: 40),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
