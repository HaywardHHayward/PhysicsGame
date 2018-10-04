GDPC                                                                                 <   res://.import/Ball.png-4e6e58f62343d577c3d22d908457c6a4.stex�%      2      4߫�4j�9ۤ�E�<   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex :      �      �Q!����|M�    res://Objects/BaseObject.tscn   �      ]       �܌�Tt@�%�� �   res://Objects/Overlay.tscn  @	      g      ��\ә�E��G��6�7$   res://Scripts/BaseObject.gd.remap    J      -       �5S�x^�F��Ba��4   res://Scripts/BaseObject.gdc�            �u��ه�A��MS���(   res://Scripts/PanelContainer.gd.remap   PJ      1       {t���oK��T�?�
}�    res://Scripts/PanelContainer.gdc�$      �       �/<����q�}t���    res://Sprites/Ball.png.import   �-      6      ~���)k���VT@��   res://default_env.tres   0      
      �?�թ+Ev�/h�!b�   res://icon.png  �J      �      �~dg`!����I�҃   res://icon.png.import   �G      .      y/�f�\�>w�ۨJ	   res://project.binary@X            %��l�����¶�
�    [gd_scene load_steps=5 format=2]

[ext_resource path="res://Scripts/BaseObject.gd" type="Script" id=1]
[ext_resource path="res://Objects/Overlay.tscn" type="PackedScene" id=2]

[sub_resource type="StreamTexture" id=1]

flags = 4
load_path = "res://.import/Ball.png-4e6e58f62343d577c3d22d908457c6a4.stex"

[sub_resource type="CircleShape2D" id=2]

custom_solver_bias = 0.0
radius = 29.7686

[node name="BaseObject" type="Area2D" index="0"]

position = Vector2( 525.336, 283.623 )
input_pickable = true
gravity_vec = Vector2( 0, 1 )
gravity = 98.0
linear_damp = 0.1
angular_damp = 1.0
audio_bus_override = false
audio_bus_name = "Master"
script = ExtResource( 1 )
_sections_unfolded = [ "Audio Bus", "Collision", "Material", "Pause", "Pickable", "Transform", "Visibility", "Z Index" ]
velocity = 0.0
mass = 0.0

[node name="Sprite" type="Sprite" parent="." index="0"]

scale = Vector2( 0.2, 0.2 )
texture = SubResource( 1 )
offset = Vector2( 0, 16 )
_sections_unfolded = [ "Animation", "Offset", "Region", "Transform" ]

[node name="CollisionShape2D" type="CollisionShape2D" parent="." index="1"]

shape = SubResource( 2 )

[node name="Overlay" parent="." index="2" instance=ExtResource( 2 )]

[connection signal="mouse_entered" from="." to="." method="_on_BaseObject_mouse_entered"]

[connection signal="mouse_exited" from="." to="." method="_on_BaseObject_mouse_exited"]


   [gd_scene format=2]

[node name="Overlay" type="PanelContainer" index="0"]

anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_right = 158.0
margin_bottom = 82.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 1
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 1
_sections_unfolded = [ "Anchor", "Focus", "Grow Direction", "Margin", "Material", "Mouse", "Rect", "Size Flags", "Theme", "Visibility" ]
__meta__ = {
"_edit_group_": true
}

[node name="Container" type="VBoxContainer" parent="." index="0"]

anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_left = 7.0
margin_top = 7.0
margin_right = 151.0
margin_bottom = 75.0
rect_min_size = Vector2( 140, 60 )
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 1
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 1
alignment = 0
_sections_unfolded = [ "Anchor", "Grow Direction", "Margin", "Rect" ]

[node name="MassContainer" type="HBoxContainer" parent="Container" index="0"]

anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_right = 144.0
margin_bottom = 20.0
rect_min_size = Vector2( 140, 20 )
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 1
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 1
alignment = 0
_sections_unfolded = [ "Anchor", "Grow Direction", "Margin", "Rect" ]

[node name="Name" type="Label" parent="Container/MassContainer" index="0"]

anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_right = 120.0
margin_bottom = 20.0
rect_min_size = Vector2( 120, 20 )
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "Mass"
valign = 1
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1
_sections_unfolded = [ "Anchor", "Margin", "Rect" ]

[node name="Value" type="Label" parent="Container/MassContainer" index="1"]

anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_left = 124.0
margin_right = 144.0
margin_bottom = 20.0
rect_min_size = Vector2( 20, 20 )
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "10"
align = 2
valign = 1
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1
_sections_unfolded = [ "Rect" ]

[node name="VelocityContainer" type="HBoxContainer" parent="Container" index="1"]

anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 24.0
margin_right = 144.0
margin_bottom = 44.0
rect_min_size = Vector2( 140, 20 )
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 1
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 1
alignment = 0
_sections_unfolded = [ "Anchor", "Grow Direction", "Margin", "Rect" ]

[node name="Name" type="Label" parent="Container/VelocityContainer" index="0"]

anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_right = 120.0
margin_bottom = 20.0
rect_min_size = Vector2( 120, 20 )
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "Velocity"
valign = 1
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1
_sections_unfolded = [ "Grow Direction", "Rect" ]

[node name="Value" type="Label" parent="Container/VelocityContainer" index="1"]

anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_left = 124.0
margin_right = 144.0
margin_bottom = 20.0
rect_min_size = Vector2( 20, 20 )
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "10"
align = 2
valign = 1
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1
_sections_unfolded = [ "Hint", "Rect" ]

[node name="AccelerationContainer" type="HBoxContainer" parent="Container" index="2"]

anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_top = 48.0
margin_right = 144.0
margin_bottom = 68.0
rect_min_size = Vector2( 140, 20 )
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 1
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 1
alignment = 0
_sections_unfolded = [ "Anchor", "Grow Direction", "Margin", "Rect" ]

[node name="Name" type="Label" parent="Container/AccelerationContainer" index="0"]

anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_right = 120.0
margin_bottom = 20.0
rect_min_size = Vector2( 120, 20 )
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "Acceleration"
valign = 1
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1
_sections_unfolded = [ "Rect", "Size Flags", "Theme" ]

[node name="Value" type="Label" parent="Container/AccelerationContainer" index="1"]

anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_left = 124.0
margin_right = 144.0
margin_bottom = 20.0
rect_min_size = Vector2( 20, 20 )
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "10"
align = 2
valign = 1
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1
_sections_unfolded = [ "Rect" ]


         GDSC         #   �      ���ׄ�   �������϶���   ���Ŷ���   ����   ���������Ѷ�   �����϶�   ������϶   ���Ӷ���   ������̶   ����   �������Ŷ���   ����׶��   �����Ӷ�   ��������Ķ��   ����������������Ķ��   ����Ӷ��   ���¶���   ������������Ķ��   ������������ض��   ������������������������ض��   �������ض���    ���������������������������Ҷ���   ��������   ��������������������������Ҷ   ����Ӷ��   ���������Ӷ�     JxޱA                      �?              D                                                                #   	   $   
   *      1      2      9      O      P      W      \      l      |      �      �      �      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #   5TT:L�  NM=�  �  T:L�  M=�  �  TT<�  TT=�  �  TT3�  LMR�  S�  P�  LMTT3�  L�	  MR�  1�
  L�  L�  L�	  N�  M�  L�  N�  MMMTT3�
  L�  MR�  �  L�  M�  S�  �  �  �  P�  �6  L�  M�  S�  �  �  �  P�  �6  L�  M�  �  �  �  �  &�  R�  S�  P�  �  LM�  �  TT3�  LMR�  S�  P�  LM�  �  �  TT3�  LMR�  S�  P�  LM�  �  �  �  T3�  L�	  MR�  �  �  L�  L�	  MN�  M�  S�  P�  �  L�  �  L�	  MN�  M[        GDSC                   �������������Ķ�   �����϶�   �������Ŷ���   ����׶��                   	                              5TT3�  LMR�  0TT3�  L�  MR�  0T[      GDST|  �            PNG �PNG

   IHDR  |  �   x�:�  �IDATx��ݱ�TW ��U��Fa	�h�ӥ�
��@!��cVvv�E�i"$5�TV��ܝsg~�W_��f{�?��                                           ��ݘ��}��{�o�in��  �C�" B�" B�" B�" ��O�,^/._���i�6g�~��:N� �!� �!� �!� �!� �w�k�e��̹Z����}�w��^��G���q���" B�" B�" B�" B�"���gh�:k�vw�,��oֽ�}��ˡ�N�/��_��՘q��|���|���|���|�����۟U/h���^�9sX��ft�k��.N� �!� �!� �!� �!� �m�����{lA���;}���Z�.m�E��K�Q��Y��>@��D>@��D>@��D>@��D>@���X�e�]xA�n��v칥�7��=�����^?{2���嫡�6g��>[�n�!� �!� �!� �!� �Q\�-�F�7����N�i��ѻo���z�"w?��" B�" B�" B�" B�"�K۔G/���?>�p�_�������e?��D>@��D>@��D>@��D>@��D�}���U;jt9�ݷ�rg���Yf-mG����E�w��á�6g��<�V:�D>@��D>@��D>@��D>@��D>@��D>@��D>@��D>@��D>@��D����C7z���ݷ�w���v7�	 B�" B�" B�" B�" ���G����uǪ,�]�rw���c��ϗ�?a��=z�����sW�������|n
'|���|���|���|���|��CX����]�%�~������" B�" B�" B�" B�",mWf�\�[��v�]��~���l�!� �!� �!� �!� ��[ڎ.O�_��f�egm���e,۽�|>�ܭ͏��%��	 B�" B�" B�" B�" "��e;����Z��>@��D>@��D>@��D>@��D>@���g�ݷ�YZ��>@��D>@��D>@��D>@��D>@�!,mo�<��O?|y����}lq,��Ywվ�|���n?x8����l��CZ;'|���|���|���|���|��CXڮڬ���tws,��Qǲ�e7N� �!� �!� �!� �!� ���1�L���暿d��R��j�[����p��|���|���|���|����1�&�8����/�^���q�r�������;h��e蹫���+St��|���|���|���|���p��g��=�򻳖�������־����p��|���|���|���|���H������|5���Ϟ��1����<z�]��q��|���|���|���|����F۝E�;����,h�>@��D>@��D>@��D>@��D>@�����"���0�.cGY�&'|���|���|���|���|���Yt�;j�w�������,h�>@��D>@��D>@��D>@��D>@���Z�Zz�;j�ߥ-�x���Q�q���" B�" B�" B�" B�"���d���Y�Y�a�:��:N� �!� �!� �!� �!� �w�6e�;��9�q��|���|���|���|��                                                                                        ���^��	�|    IEND�B`�              [remap]

importer="texture"
type="StreamTexture"
path="res://.import/Ball.png-4e6e58f62343d577c3d22d908457c6a4.stex"

[deps]

source_file="res://Sprites/Ball.png"
dest_files=[ "res://.import/Ball.png-4e6e58f62343d577c3d22d908457c6a4.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
stream=false
size_limit=0
detect_3d=true
svg/scale=0.1
          [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

radiance_size = 4
sky_top_color = Color( 0.0470588, 0.454902, 0.976471, 1 )
sky_horizon_color = Color( 0.556863, 0.823529, 0.909804, 1 )
sky_curve = 0.25
sky_energy = 1.0
ground_bottom_color = Color( 0.101961, 0.145098, 0.188235, 1 )
ground_horizon_color = Color( 0.482353, 0.788235, 0.952941, 1 )
ground_curve = 0.01
ground_energy = 1.0
sun_color = Color( 1, 1, 1, 1 )
sun_latitude = 35.0
sun_longitude = 0.0
sun_angle_min = 1.0
sun_angle_max = 100.0
sun_curve = 0.05
sun_energy = 16.0
texture_size = 2

[resource]

background_mode = 2
background_sky = SubResource( 1 )
background_sky_custom_fov = 0.0
background_color = Color( 0, 0, 0, 1 )
background_energy = 1.0
background_canvas_max_layer = 0
ambient_light_color = Color( 0, 0, 0, 1 )
ambient_light_energy = 1.0
ambient_light_sky_contribution = 1.0
fog_enabled = false
fog_color = Color( 0.5, 0.6, 0.7, 1 )
fog_sun_color = Color( 1, 0.9, 0.7, 1 )
fog_sun_amount = 0.0
fog_depth_enabled = true
fog_depth_begin = 10.0
fog_depth_curve = 1.0
fog_transmit_enabled = false
fog_transmit_curve = 1.0
fog_height_enabled = false
fog_height_min = 0.0
fog_height_max = 100.0
fog_height_curve = 1.0
tonemap_mode = 0
tonemap_exposure = 1.0
tonemap_white = 1.0
auto_exposure_enabled = false
auto_exposure_scale = 0.4
auto_exposure_min_luma = 0.05
auto_exposure_max_luma = 8.0
auto_exposure_speed = 0.5
ss_reflections_enabled = false
ss_reflections_max_steps = 64
ss_reflections_fade_in = 0.15
ss_reflections_fade_out = 2.0
ss_reflections_depth_tolerance = 0.2
ss_reflections_roughness = true
ssao_enabled = false
ssao_radius = 1.0
ssao_intensity = 1.0
ssao_radius2 = 0.0
ssao_intensity2 = 1.0
ssao_bias = 0.01
ssao_light_affect = 0.0
ssao_color = Color( 0, 0, 0, 1 )
ssao_quality = 0
ssao_blur = 3
ssao_edge_sharpness = 4.0
dof_blur_far_enabled = false
dof_blur_far_distance = 10.0
dof_blur_far_transition = 5.0
dof_blur_far_amount = 0.1
dof_blur_far_quality = 1
dof_blur_near_enabled = false
dof_blur_near_distance = 2.0
dof_blur_near_transition = 1.0
dof_blur_near_amount = 0.1
dof_blur_near_quality = 1
glow_enabled = false
glow_levels/1 = false
glow_levels/2 = false
glow_levels/3 = true
glow_levels/4 = false
glow_levels/5 = true
glow_levels/6 = false
glow_levels/7 = false
glow_intensity = 0.8
glow_strength = 1.0
glow_bloom = 0.0
glow_blend_mode = 2
glow_hdr_threshold = 1.0
glow_hdr_scale = 2.0
glow_bicubic_upscale = false
adjustment_enabled = false
adjustment_brightness = 1.0
adjustment_contrast = 1.0
adjustment_saturation = 1.0

            GDST@   @           �  PNG �PNG

   IHDR   @   @   �iq�  tIDATx��{p�U�����#�t��y�@y@�	��D�8;#ಳ���S3���FJ�*�-�]fQ�qx�K��B��$�y����o�AB:�n���U����{�=�|����ۢ`�<<^? �V����.%!L��(�K���m�e5p,� ZD��y x�~��h�=#@u�48��n����@��1��Z�^��$�} j��V��R!�tK��/�"$��^�>��d�=R�����% �7�J�>!Im�	�Ԛ��x !$Tj:c�DB��������4BSd4h ��IH*���x �Tj��$ ����I:��@�J�3�U߅�R���N%-�B�A �V�u�it���J@�7������I � B��В`b��b�3�}��bg��b,	���U ����,̞2�IwR�3!����}���ưm~��1-�����P~�������49�Dϸ;�pD��L徱�!QV�ƻ{�8\�¸O�N�w��[���-�Ⱥ��<�`�0+w����,���u�$�n��ɳ�q�7�������E�ֲ�������w����͜1Cx����Kouk�O̠�dӑx�2��?P��3�ә~GcF����+hs��s\w:�&�&)���w����n���2�r()�'{���!vJ����Ql8T��/wk�����=U,~�I�f�MO��;\�N��Z��@�:[����]��Z������-G�¶�ym�"�h�24����7����[��{:��h������*�S�7}ċ�:���t��Վ�ew���#^�<�u2S�-�LM�y[�KfW=��^{�1���=�8ߝ6�݇������p����,|��&�MU���Ǝ�鋊������sOSR��ʷ6����L����0i�w ��}�xsC�rŨiO) &������i�p�C����/�S����>�MIQ9Y��e5�%Rn���%�ܒ��?�s����OL��?���ƤS�	�������?�(����)3�����x�Lv��"k�U��T#?�7��fݏ�d��i闁})��_���6���Q���geY����U'բg�ܙ��7���}��s�%���P��������n�݌�'S���y���d��SQ����\������j���4^j۾k�9	.[<I�a�S=��ht�t��[==��
+��BRiX�xn�r":`������+il��il���+W���)%�Ft���t�;�l��!�
����y��Y��Et@C��L��Iy���o3��Rȴih����?�MYEK��a3i��@b3iY2-���>�xwĺ
���o֡�^x0?�J$/<��FR��o�
�_@����K��vwg'SZ�wJ�VSZh���d^[�������F���e�3HO2�ZG��xr\�YV�&-�Ml=Vω����h)�Lb��t�N����xm��5rb5��ç{��u,`�k{M�Z�Z^�;�������M����[�n,�5�$���d# ��Iz������������2��xL�`oy�%�ydX��={�E1g�#�zx67ld��lF�%�m���'51�y�ȴD�O�fㆍ�zx6sf?¢��8{�,V#KJ�bQ�W��3��L����e�ϗQYy �������}{�:���Q����%�^PBqfR����۷�7^��3	RYy��?_���e��d����3��a�&�������ԣ|׮�d��<מ�$	$I�kO�)w��]�z.aMMM���#�`Xr�����+�O�N�\�����6��ËV~���WsG���v@c���]��撗��{)I3g��pU�)��UfΜ�$uW1/?���\�_v�%>�KZ��O�Q���rJKKIM�SXX����m���Tc�2w�j�m��|�/),,$5�N���X��+���C��$EO7�����iy����"�����h�6��m���~����\����ҫ�bԪQ�3;X��WT6��o��e�+������0hT��Z�Z"�v��"�+�Ŏ���	�
k�T�fOV�O@[�F��٠' �i<@PVX�eM�r��y#�����I�#@��%C�Q�N�ˏ�����]��OyC;m�9J���OK�f�b3i����L���'4������kvr�Çդ%+�Ș��nuZ=���z�Q�aaL���r���-����.��ǊI�.(����p�9��ΠY�ރ��i8Py�w�Vu{f���g�ΨtK���?�G�-��mrA
���|P����[x�J.?-����ߓM��!}X�Q;  ˨U=á�+J�9<gZѫ%�aBU�$H��[��owV��㟦�R���J�aW�j	�J����uԨ�`�e5QO�m�.����b���]^j���zW���U5�\W���j.�P�$��E���4W^jb���a5ii�� 5�P^]��9��;��Cq��\`p����AZ��+/�.�BWً�BH2j0i�u����+#�9s��O{���{��d��ߡ0�������'eq�e��ZL:5&��I����D���Nez���.��p�H6ki�hl���q���|A\� ��~v�i۾0�B��Ț#'�5+��Q�V���.����G���o��W��I�A��?�>�0꣱.|� /��DA���g �ƌ�����D^Y��O�%�epǾcd���x�L�*�W�����hQK��^���v^�`;���}�����`�%O�&�n�w;+8Zۿ��2&+�N�%�f⵵[X��O1�P����� ZC���ՔU�0�<Z2���8}.�6:���a6M��'����ʲ�ֲm�����Keԓ`84j5ߛu?���5�Ls���O5r�����mx�Oe�E��(L�P��Ĕ�vR���;Y���������]�`�ЅZ�b�]�̚2����U*�BeSU�\Էxhl������㗑C
mW��YT���Ua1h��Ǟ�'�j`� �'��AY��c����9RFP�q��ע�i(�Ϧ8?���3��"����h������q�������0�G"�;B���8x�O���L�Q��b#-�J�لѠC-IX-��rG�9�����t���BC� �=���VP�aVe�~3���o������@���SP�
� !y��m᪭
���� �o�;@���V�߹]�ZQ9���M���$��(�,	i�w{����ֿj'�� ^g�����U�̑ �j��ɠ�<(J!$��c��A�Og��n��PB�;��)!IV:P���V�g�>�*���d�Ƿ�`�-1u>�ۇ*=o n�O��Rp�9�j�P=B�>�������w���
��"��eY�Q�Ѩ��1>��g�    IEND�B`�   [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
  [remap]

path="res://Scripts/BaseObject.gdc"
   [remap]

path="res://Scripts/PanelContainer.gdc"
               �PNG

   IHDR   @   @   �iq�  qIDATx��{pTU����~���I�A	$2$�H E, 
(�>��ؙ\vvqtwj�ف�}��H�S�̨�*����0��
��S^�
B!$��t������!��N��t�_U�n�9�;������sסO�'}��QA!~'i�E�Dw2��P��w=�%EY}���c�˕�ɢ�!u�$m�)��qz�ȷD�~F����y��ly���n\s�i�}�����$!�Pi��4:$YF�V��g%H0��u��� *�.����zr�W֥Ô���V-���>��Z�G�d�����B I2*��FK��A� !��_�#1��'��:� �MH��V�ܯ~\mV���-�HZYZ(@Vk���H�
�V�@�ZYZ(Ձd��V����akPxP�������:[�$�����KJ00u|	�Y�^��43u|	I	�7��U ��������=e<��*bX�@�(�¦���C��ŢG�[6!AE���%v)g���X[�EϘ;�hh�L徱E!Q^�ʻ{�9|��qy&�*�����OEu]�r��Y�-�Ⱥ�8x����F�2����,���u��n�ɩs�1�7�H���w�/���/��x=��3���ɜ�y����ov)���������%\� ��6��%-A�̒L�����y<��JZ�Θ��i޴��HN�g�;�x{Ou��� �r���;�L�@3�Ņ�3f�������<����%�"91�iG�R�ض ����8�L��2��cu̽+��/[��}��˖�u!�tȼ��XS�]k�	:5�������3��t��ڝ��W������(�]�7uĊ�:��� �
��֨ew��#VD��j���L�NO��Z��CfG���N}�Q��_>�ߟ6�݇��ݻ��t�
z���/z��&�Mu���F[Ԋ�Fe���&;���S����͍�<^����9L�= ��c+���\1bړ
���6��?������_�������%���wSZ\@^N&�y���*7oiT�`^� ����z�<���'��{�/`Ъ��������x��;��r4[�eFR��b�̛�ί/�v� v�n�G�����qx�,�t��5�}2�7�A�u�/p���{x�e�Y�e��9�9�'�X2o&��>?p�W��� �dֿ�sj��<���@ׯ�o���	P���yё��Ǡ��l�wy���}l����l�WZB��h�v�˗�C�լ�v��� ���o�x��W7�|�U�N#�j�/�׫���=��qŅ���*�B��#�mn��k��=�4lް���E���'b�����\�:��6_X44Y�6�1� ��{;3� �lSM�']a��ǻ)��a�LML�OLK�P^YÇ��7��� ���:Ԓ�s�T���QK
���:�����(p��
����ݹ)��ҺՔ��;7�W�n�bÕ^�G4�ӧ{Y��2��=�Ѫ$��CI��AC����c���z����df��dHZ�/�k���`m�+ǁ�8�>?�toD�#^�u���8/�E�1 ��ƽ��ܓ�ʻ{����ͅ�����\`����J�(+�������hvz{(�T<��`Oq�ed�8w��-f��G���l6n�Ȃ���HY.=QGzb�����,�������l��~�ŋs��9��q,-+�F��sH,^�b�n7�~����� 8�N^�u����������dV/,e��RJ����Oaf߾�����8��A����,��r�n7����{8���b@AEE��[��]�< ���|s�$�$A�9�������}�X,TTT �`pJ���쀦k�O�V2]���d�~�ds�ф�{t��d�{|��hlss���|

��.%Ib����>v���̙3���*����ū���Ob�
+����2����b�op���<��̝�q�ͬX����HO7S�@+W�@A��'�P=6A�3m����xfZ���!pz�l=ZǺ��!��=�������yj�`^x�e�4*E��e�>��*K������p���O��
�Z����9|�`�ח1^[_�8u9d_@a͞j��&˨�j���B�Yb�7��z5�PX�eM�r#�y3��'�b@�-@����Q�I�Ë�����\�쥢������e$�(�H�d�`2h04�����j����r����7ٹb�`4h�I�c� c�<-.~�ցee%1:��c:���fN��|`ţ%dܰ(�j�`ux9��ƀ-9ƞm7Up��*�����x��O�?��Ia�?�@٦���RY��P������_Tauxivt]��=��؋%��|� *��r���uV%�Ft*	w���,	2���l�;+�����|J�R�%A ��N%��%ꬮ�A�,��C����lms`��9,f���
���7�ʜ�C%K�\qt�7��\q��%�7��a����.u��h���j�-��BÇ���n��7�UO|s�������iq�P�}к0{i�?4! 9N�A�"N�U͎�B1<#���z�������)&��=�2�8U߽����2No��x�
�V�ɠ!��s�^�U���K=wp�Z�:<��khs�hluc���:�8<~?W�^v�m
Y�(+�Lck���Ԭ�7G�5����3�s�v~��I���ǐ�<�����~(�xk���ǋk61,#��(�v:G-D{$xXF"/��ԫ���0�c�1r�SY2o&*Y���g�m+<RT��_�c�p3�}����EW>�
Wo����ҧf�o��՝���[��f���O��m2���-�����eȩy#�@��<�t���5L9���C�����r?O�����lb��!�pR�--,e-�v�J���>TF�	�B�R�Y�3����i����t#'j[8Uߊ�~W&Rtj���$�s��2�Lj���6;�?���>��?�%rG'�'t��e&�UĬ)�_2�,*TYlT_qP�좱͍��M�ˇ� Th�vL.I�F�z�L�^MZ�s��,���IK@��@�/��a�_��H9���;8���VMqa.%����#7�L�)��'���T�5r��y�WTs�L5�(z�pDuF(�O�������4j�&2R�$���kQIƤ�p���N ����fw���LC��/�9�͢RP��(J�������[���op+P�����B=�_&���i�B��t���w����a��k�.	X�(J��q}'ZA0���q�(J@�j���5jԨUw|d�!�m�J�?n{(
N����s�o�~�]��S}|�dP�=.%�B�;��h��Y?>����Bvۮ��o=,�i]��IZ�w��˳��lY��u���NCWj^��.%e���O-T&�(:��s������|�3�y?��c�ٓ��Z}�s�����J~u�qK    IEND�B`�      ECFG      application/config/name         Physics Game   application/run/main_scene(         res://Objects/BaseObject.tscn      application/config/icon         res://icon.png  )   rendering/environment/default_environment          res://default_env.tres     GDPC