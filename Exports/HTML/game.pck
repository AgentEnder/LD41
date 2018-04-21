GDPC                                                                                 <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex /      �      �Q!����|M�   res://Door.tscn �      �      ��w�k����VB���   res://Player.gd.remap   `O      !       ��0�F �qq��dX��   res://Player.gdc�      J      7Ϧ�-�F��M��a�   res://Player.tscn          a      ��J"�8����9S�~�   res://Room.gd.remap �O             317�9�&iZ�(����   res://Room.gdc  �      �	      ���R�94���EE�J   res://Room.tscn        �      �`�ezh�Ex�LPZ�   res://Walls/Door.gd.remap   �O      %       ��"� h
�H���   res://Walls/Door.gdc�      �      ��7;��ea��_W�0   res://Walls/HorizDoor.tscn  �      �      �Q�����>�R4A_   res://Walls/VertDoor.tscn   @       �      �	:\~Y*��
����}�   res://Walls/Wall.tscn   @"      �      �=��> �t�����   res://default_env.tres   %      
      �?�թ+Ev�/h�!b�   res://icon.png   P      �      �~dg`!����I�҃   res://icon.png.import   �<      �      V,��V�z������&�   res://main.gd.remap �O             ֤�\n�������Dݮ�   res://main.gdc  �?      V	      R���	�	�
�@��   res://main.tscn �H      q      }��1M��t��.�Җk   res://project.binary�]            ��4W��� �Mc$��    [gd_scene load_steps=3 format=2]

[ext_resource path="res://Walls/Door.gd" type="Script" id=1]

[sub_resource type="RectangleShape2D" id=1]

custom_solver_bias = 0.0
extents = Vector2( 512, 300 )

[node name="Door" type="Area2D"]

position = Vector2( 480, 268 )
input_pickable = true
gravity_vec = Vector2( 0, 1 )
gravity = 98.0
linear_damp = 0.1
angular_damp = 1.0
audio_bus_override = false
audio_bus_name = "Master"
script = ExtResource( 1 )
_sections_unfolded = [ "Transform" ]

[node name="CollisionShape2D" type="CollisionShape2D" parent="." index="0"]

position = Vector2( 32, 32 )
shape = SubResource( 1 )
_sections_unfolded = [ "Transform" ]

[connection signal="body_entered" from="." to="." method="_on_Door_body_entered"]


GDSC         '   �      ������������τ�   �����ض�   ��������Ҷ��   ������Ŷ   ���������������ζ���   �����϶�   ���������¶�   �������Ӷ���   ���������������Ŷ���   ����׶��   ����¶��   ���������������������Ҷ�   ������¶   ����������������Ҷ��   ϶��   ζ��   ������������Ҷ��   ���������Ҷ�   �������������Ӷ�  �                      Camera        Camera2D   	   ui_accept y                                      ui_up M       ui_down       ui_left�      ui_right                   
                                 	   %   
   ;      =      >      E      P      Y      c      l      m      x            �      �      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   5TT=�  �  LMT=�  TT=�  H�  N�  IT=�  �  TT3�  LMR�  �  H�  LMP�  L�  MN�  LMP�  L�  MI�  0TT3�  L�	  MR�  &L�
  P�  L�  MMR�  �  H�  IP�  �  �  �  L�  �  M�  �  �  H�  IP�  �  �  �  &L�
  P�  L�	  MMR�  �  P�  �  �  'L�
  P�  L�
  MMR�  �  P�  �  �  (R�  �  P�  �  �  �  &L�
  P�  L�  MMR�  �  P�  �  �  'L�
  P�  L�  MMR�  �  P�  �  �  (R�  �  P�  �  �  �  &�  P�  LMR�  �  �  P�  LM�  �  �  �  �  �  �  L�  MT[      [gd_scene load_steps=4 format=2]

[ext_resource path="res://Player.gd" type="Script" id=1]
[ext_resource path="res://icon.png" type="Texture" id=2]

[sub_resource type="RectangleShape2D" id=1]

custom_solver_bias = 0.0
extents = Vector2( 32, 32 )

[node name="Player" type="KinematicBody2D" groups=[
"Player",
]]

input_pickable = false
collision_layer = 1
collision_mask = 1
collision/safe_margin = 0.08
script = ExtResource( 1 )

[node name="Sprite" type="Sprite" parent="." index="0"]

texture = ExtResource( 2 )

[node name="Coll" type="CollisionShape2D" parent="." index="1"]

shape = SubResource( 1 )


               GDSC         >   7     ���ӄ�   ����Ŷ��   ���ڶ���   ��������Ӷ��   ������������Ŷ��   ��������Ŷ��   ������������Ŷ��   �����Ŷ�   �����Ŷ�   �����϶�   ���¶���   ���������Ŷ�   ��������Ŷ��   ���������Ŷ�   ߶��   ������������Ӷ��   �������Ӷ���   ��������Ҷ��   ������������Ӷ��   ����Ӷ��   ζ��   �������ض���   ϶��   ������ٶ   �������Ӷ���   �������¶���   �������Ӷ���                res://Walls/Wall.tscn                A           4            res://Walls/HorizDoor.tscn        res://Walls/VertDoor.tscn     �                          `                                    @                      Camera                                 "      ,      ;      E   	   R   
   Y      Z      `      b      c      l      p      t      x      y            �      �      �      �      �      �      �      �      �      �      �       �   !     "     #     $   %  %   .  &   ;  '   P  (   U  )   [  *   f  +   r  ,   �  -   �  .   �  /   �  0   �  1   �  2   �  3   �  4   �  5   �  6   �  7   �  8   �  9     :     ;   "  <   #  =   )  >   5TT=�  HNNNIT=�  ?L�  MT=�  �  L�  N�  MT=�  �  L�  N�  MT=�  H?L�  MN?L�  MIT=�  �  L�  N�	  MT=�  HNN�
  N�  IT=�  �  LMTT3�	  LMR�  0�  T3�
  L�  N�  MR�  �  �  �  �  �  �  �  LMTT3�  LMR�  )�  �@  L�L  L�  MMR�  &�  R�  &L�  H�  I�  MR�  =�  �  HIP�  LM�  �  L�  M�  'L�  H�  IMR�  =�  �  P�  LM�  �  P�  �  L�  P�  N�  M�  �  P�  �  L�  H�  I�  N�  H�  I�  M�  �  L�  M�  '�  �  R�  &L�  H�  I�  MR�  =�  �  H�  IP�  LM�  �  P�  �  L�  H�  I�  NM�  �  L�  M�  'L�  H�  IMR�  =�  �  P�  LM�  �  P�  �  L�  N�  P�  M�  �  P�  �  L�  H�  I�  N�  H�  I�  M�  �  L�  M�  '�  �  R�  &L�  H�  I�  MR�  =�  �  HIP�  LM�  �  P�  �  L�  HIN�  H�  I�  M�  �  L�  M�  'L�  H�  IMR�  =�  �  P�  LM�  �  P�  �  L�  P�  N�  M�  �  P�  �  L�  H�  I�  N�  H�  I�  M�  �  L�  M�  '�  �  R�  &L�  H�  I�  MR�  =�  �  H�  IP�  LM�  �  L�  M�  'L�  H�  IMR�  =�  �  P�  LM�  �  P�  �  L�  N�  P�  M�  �  P�  �  L�  HI�  N�  H�  I�  M�  �  L�  MTT3�  LMR�  �  LMP�  LMP�  L�  M[     [gd_scene load_steps=4 format=2]

[ext_resource path="res://Room.gd" type="Script" id=1]
[ext_resource path="res://icon.png" type="Texture" id=2]
[ext_resource path="res://Door.tscn" type="PackedScene" id=3]

[node name="Room" type="Node2D"]

script = ExtResource( 1 )

[node name="Center" type="Position2D" parent="." index="0"]

position = Vector2( 512, 300 )
_sections_unfolded = [ "Transform" ]

[node name="Cover" type="Sprite" parent="." index="1"]

modulate = Color( 0, 0, 0, 1 )
scale = Vector2( 16, 9.5 )
z_index = 1
texture = ExtResource( 2 )
centered = false
_sections_unfolded = [ "Offset", "Transform", "Visibility", "Z Index" ]

[node name="Door" parent="." index="2" instance=ExtResource( 3 )]


         GDSC            \      ���ׄ�   �����϶�   ��������������������Ҷ��   ���϶���   ����������ƶ   ���۶���   ���������¶�   �������Ӷ���   �������Ӷ���   ���������Ӷ�   �������Ӷ���   �����������������ƶ�   �������ض���   ��������������ض      Player        Cover         Camera                  Center                                                      	      
                                                   )      0      9      D      5TTTTTT3�  LMR�  �  �  0TTTTTTT3�  L�  MR�  &L�  P�  LMMR�  =�  �  LM�  &�  P�  L�  MR�  �  P�  L�  MP�	  LM�  �
  LMP�  L�  MH�  IP�  �  P�  L�  MP�  [           [gd_scene load_steps=2 format=2]

[ext_resource path="res://Walls/Wall.tscn" type="PackedScene" id=1]

[node name="HorizDoor" type="Node2D"]

[node name="Wall6" parent="." index="0" instance=ExtResource( 1 )]

position = Vector2( 800, 32 )
scale = Vector2( 7, 1 )

[node name="Wall5" parent="." index="1" instance=ExtResource( 1 )]

position = Vector2( 224, 32 )
scale = Vector2( 7, 1 )


           [gd_scene load_steps=2 format=2]

[ext_resource path="res://Walls/Wall.tscn" type="PackedScene" id=1]

[node name="VertDoor" type="Node2D"]

_sections_unfolded = [ "Transform" ]

[node name="Wall" parent="." index="0" instance=ExtResource( 1 )]

position = Vector2( 32, 128 )
scale = Vector2( 1, 4 )
_sections_unfolded = [ "Transform" ]

[node name="Wall2" parent="." index="1" instance=ExtResource( 1 )]

position = Vector2( 32, 480 )
scale = Vector2( 1, 4 )
_sections_unfolded = [ "Transform" ]


             [gd_scene load_steps=3 format=2]

[ext_resource path="res://icon.png" type="Texture" id=1]

[sub_resource type="RectangleShape2D" id=1]

custom_solver_bias = 0.0
extents = Vector2( 32, 32 )

[node name="Wall" type="StaticBody2D"]

input_pickable = false
collision_layer = 1
collision_mask = 1
constant_linear_velocity = Vector2( 0, 0 )
constant_angular_velocity = 0.0
friction = 1.0
bounce = 0.0

[node name="icon" type="Sprite" parent="." index="0"]

modulate = Color( 0.0273438, 0, 0, 1 )
position = Vector2( 0, -1 )
texture = ExtResource( 1 )
_sections_unfolded = [ "Visibility" ]

[node name="CollisionShape2D" type="CollisionShape2D" parent="." index="1"]

shape = SubResource( 1 )


               [gd_resource type="Environment" load_steps=2 format=2]

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
source_md5="ae7e641067601e2184afcade49abd283"

dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]
dest_md5="84511021bbc8c9d37c7f0f4d181de883"

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
       GDSC      	   M   J     ���ӄ�   ���۶���   ��ƶ   ����������Ŷ   �����϶�   ζ��   �����Ҷ�   ϶��   ������۶   ������¶   �����۶�   ����Ŷ��   �������ⶶ��   ������۶   �������Ӷ���   ���¶���   �������ض���   ��������Ҷ��   ����Ӷ��   ���������Ķ�      res://Room.tscn                      �������?                                      X                                                 "      &   	   1   
   9      D      O      Y      Z      e      p      w      x      z      {      �      �      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #      $     %   
  &     '     (     )   #  *   4  +   =  ,   P  -   W  .   Z  /   a  0   b  1   n  2   u  3   �  4   �  5   �  6   �  7   �  8   �  9   �  :   �  ;   �  <   �  =   �  >   �  ?   �  @   �  A     B     C     D     E     F   +  G   5  H   :  I   <  J   ?  K   F  L   H  M   5TT=�  ?LMT=�  HIT=�  �  L�  N�  MTT3�  LMR�  �  LM�  )�  �@  L�  P�  MR�  �  P�  LHIM�  )�  �@  L�  P�  MR�  �  H�  IP�  LHIM�  �  H�  IH�  I�  �  �  )�  �@  L�  P�  MR�  )�  �@  L�  P�  MR�  �  L�  N�  M�  �  0TT3�	  LMR�  �  LM�  =�
  �   LM�  1�  L�
  �  MTT3�  L�  N�  MR�  &�  
�  �  	�  P�  R�  &�  
�  �  	�  P�  R�  =�  H�  N�  N�  N�  I�  �  &�  �  	�  R�  �  H�  I�  �  '�3  L�  H�  IH�  �  IM�  R�  �  H�  I�	  LM�  '�  H�  IH�  �  IP�  H�  I�  R�  �  H�  I�  �  (R�  �  H�  I�  �  �  &�  �  �  P�  R�  �  H�  I�  �  '�3  L�  H�  IH�  �  IM�  R�  �  H�  I�	  LM�  '�  H�  IH�  �  IP�  H�  I�  R�  �  H�  I�  �  (R�  �  H�  I�  �  �  &L�  �  �  P�  MR�  �  H�  I�  �  '�3  L�  H�  �  IH�  IM�  R�  �  H�  I�	  LM�  '�  H�  �  IH�  IP�  H�  I�  R�  �  H�  I�  �  (R�  �  H�  I�  �  �  &L�  �  	�  MR�  �  H�  I�  �  '�3  L�  H�  �  IH�  IM�  R�  �  H�  I�	  LM�  '�  H�  �  IH�  IP�  H�  I�  R�  �  H�  I�  �  (R�  �  H�  I�  �  �  �  =�  �  P�  LM�  �  P�  L�  L�  N�  MN�  M�  �  P�  �  L�  �  N�  �  M�  �  H�  IH�  I�  �  �  L�  M�  1�  (R�  �  L�  LMM�  0T[          [gd_scene load_steps=3 format=2]

[ext_resource path="res://main.gd" type="Script" id=1]
[ext_resource path="res://Player.tscn" type="PackedScene" id=2]

[node name="Level" type="Node2D" index="0"]

script = ExtResource( 1 )
_sections_unfolded = [ "Transform" ]

[node name="Camera" type="Camera2D" parent="." index="0" groups=[
"Camera",
]]

position = Vector2( 512, 300 )
anchor_mode = 1
rotating = false
current = true
zoom = Vector2( 1, 1 )
limit_left = -10000000
limit_top = -10000000
limit_right = 10000000
limit_bottom = 10000000
limit_smoothed = false
drag_margin_h_enabled = false
drag_margin_v_enabled = false
smoothing_enabled = false
smoothing_speed = 5.0
offset_v = 0.0
offset_h = 0.0
drag_margin_left = 0.2
drag_margin_top = 0.2
drag_margin_right = 0.2
drag_margin_bottom = 0.2
editor_draw_screen = true
editor_draw_limits = true
editor_draw_drag_margin = true
_sections_unfolded = [ "Drag Margin", "Editor", "Transform" ]

[node name="Player" parent="." index="1" instance=ExtResource( 2 )]

position = Vector2( 276.764, 134.482 )

[node name="Camera2D" type="Camera2D" parent="." index="2"]

anchor_mode = 0
rotating = false
current = false
zoom = Vector2( 5, 5 )
limit_left = -10000000
limit_top = -10000000
limit_right = 10000000
limit_bottom = 10000000
limit_smoothed = false
drag_margin_h_enabled = true
drag_margin_v_enabled = true
smoothing_enabled = false
smoothing_speed = 5.0
offset_v = 0.0
offset_h = 0.0
drag_margin_left = 0.2
drag_margin_top = 0.2
drag_margin_right = 0.2
drag_margin_bottom = 0.2
editor_draw_screen = true
editor_draw_limits = false
editor_draw_drag_margin = false
_sections_unfolded = [ "Transform" ]


               [remap]

path="res://Player.gdc"
               [remap]

path="res://Room.gdc"
 [remap]

path="res://Walls/Door.gdc"
           [remap]

path="res://main.gdc"
 �PNG
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
N����s�o�~�]��S}|�dP�=.%�B�;��h��Y?>����Bvۮ��o=,�i]��IZ�w��˳��lY��u���NCWj^��.%e���O-T&�(:��s������|�3�y?��c�ٓ��Z}�s�����J~u�qK    IEND�B`�      ECFG      application/config/name         TopDownTesting/    application/run/main_scene         res://main.tscn    application/config/icon         res://icon.png_ )   rendering/environment/default_environment          res://default_env.tres                 GDPC