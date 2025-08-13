import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_copy_v1/common/bloc/favorite_buttion/favorite_button_cubit.dart';
import 'package:spotify_copy_v1/domain/entities/song/song.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../bloc/favorite_buttion/favorite_button_state.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.songEntity, this.function});

  final Function? function;
  final SongEntity songEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          if (state is FavoriteButtonInitial) {
            return IconButton(
              onPressed: () {
                context
                    .read<FavoriteButtonCubit>()
                    .favoriteButtonUpdated(songEntity.songId);

                if (function != null) {
                  function!();
                }
              },
              icon: Icon(
                songEntity.isFavorite ? Icons.favorite : Icons.favorite_outline,
                size: 25,
                color: AppColors.darkGrey,
              ),
            );
          }

          if (state is FavoriteButtonUpdated) {
            return IconButton(
              onPressed: () {
                context
                    .read<FavoriteButtonCubit>()
                    .favoriteButtonUpdated(songEntity.songId);
              },
              icon: Icon(
                state.isFavorite ? Icons.favorite : Icons.favorite_outline,
                size: 25,
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
