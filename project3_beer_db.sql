PGDMP      *                 |            proj3_beer_db    16.0    16.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    17653    proj3_beer_db    DATABASE     �   CREATE DATABASE proj3_beer_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE proj3_beer_db;
                postgres    false            �            1259    18010    AnnualCraftBreweryCounts    TABLE     �   CREATE TABLE public."AnnualCraftBreweryCounts" (
    "Year" smallint NOT NULL,
    "BreweryCat" character varying(20) NOT NULL,
    "BreweryCounts" smallint
);
 .   DROP TABLE public."AnnualCraftBreweryCounts";
       public         heap    postgres    false            �            1259    18005    AnnualCraftProduction    TABLE     �   CREATE TABLE public."AnnualCraftProduction" (
    "Year" smallint NOT NULL,
    "BreweryCat" character varying(20) NOT NULL,
    "AnnualCraftProductionAmount" integer
);
 +   DROP TABLE public."AnnualCraftProduction";
       public         heap    postgres    false            �            1259    18015    AnnualStateCraftProduction    TABLE     �   CREATE TABLE public."AnnualStateCraftProduction" (
    "StateID" character varying(2) NOT NULL,
    "Year" smallint NOT NULL,
    "AnnualCraftStateProdAmount" integer
);
 0   DROP TABLE public."AnnualStateCraftProduction";
       public         heap    postgres    false            �            1259    18025    AnnualTTBStatePermitCount    TABLE     �   CREATE TABLE public."AnnualTTBStatePermitCount" (
    "StateID" character varying(2) NOT NULL,
    "Year" smallint NOT NULL,
    "StateTTBPermitCount" smallint
);
 /   DROP TABLE public."AnnualTTBStatePermitCount";
       public         heap    postgres    false            �            1259    17995    QuarterlyProduction    TABLE     �  CREATE TABLE public."QuarterlyProduction" (
    "StateID" character varying(2) NOT NULL,
    "Year" smallint NOT NULL,
    "Quarter" character varying(2) NOT NULL,
    "TotalQuarterProd" double precision,
    "TaxableBottlesCansProd" double precision,
    "TaxableKegsProd" double precision,
    "TaxablePremUseProd" double precision,
    "TaxFreeExportProd" double precision,
    "TaxFreePremUseProd" double precision,
    "StocksOnHand" double precision
);
 )   DROP TABLE public."QuarterlyProduction";
       public         heap    postgres    false            �            1259    17980    States    TABLE     �   CREATE TABLE public."States" (
    "StateID" character varying(2) NOT NULL,
    "StateName" character varying(20) NOT NULL,
    "GeoCenterLat" double precision NOT NULL,
    "GeoCenterLong" double precision NOT NULL
);
    DROP TABLE public."States";
       public         heap    postgres    false            �            1259    17985    StatesCensusData    TABLE     �   CREATE TABLE public."StatesCensusData" (
    "StateID" character varying(2) NOT NULL,
    "Year" smallint NOT NULL,
    "Population" integer NOT NULL
);
 &   DROP TABLE public."StatesCensusData";
       public         heap    postgres    false                      0    18010    AnnualCraftBreweryCounts 
   TABLE DATA           [   COPY public."AnnualCraftBreweryCounts" ("Year", "BreweryCat", "BreweryCounts") FROM stdin;
    public          postgres    false    219   )(                 0    18005    AnnualCraftProduction 
   TABLE DATA           f   COPY public."AnnualCraftProduction" ("Year", "BreweryCat", "AnnualCraftProductionAmount") FROM stdin;
    public          postgres    false    218   �(                 0    18015    AnnualStateCraftProduction 
   TABLE DATA           g   COPY public."AnnualStateCraftProduction" ("StateID", "Year", "AnnualCraftStateProdAmount") FROM stdin;
    public          postgres    false    220   *                 0    18025    AnnualTTBStatePermitCount 
   TABLE DATA           _   COPY public."AnnualTTBStatePermitCount" ("StateID", "Year", "StateTTBPermitCount") FROM stdin;
    public          postgres    false    221   �1       
          0    17995    QuarterlyProduction 
   TABLE DATA           �   COPY public."QuarterlyProduction" ("StateID", "Year", "Quarter", "TotalQuarterProd", "TaxableBottlesCansProd", "TaxableKegsProd", "TaxablePremUseProd", "TaxFreeExportProd", "TaxFreePremUseProd", "StocksOnHand") FROM stdin;
    public          postgres    false    217   �6                 0    17980    States 
   TABLE DATA           [   COPY public."States" ("StateID", "StateName", "GeoCenterLat", "GeoCenterLong") FROM stdin;
    public          postgres    false    215   ��       	          0    17985    StatesCensusData 
   TABLE DATA           M   COPY public."StatesCensusData" ("StateID", "Year", "Population") FROM stdin;
    public          postgres    false    216   ��       p           2606    18014 6   AnnualCraftBreweryCounts AnnualCraftBreweryCounts_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."AnnualCraftBreweryCounts"
    ADD CONSTRAINT "AnnualCraftBreweryCounts_pkey" PRIMARY KEY ("Year", "BreweryCat");
 d   ALTER TABLE ONLY public."AnnualCraftBreweryCounts" DROP CONSTRAINT "AnnualCraftBreweryCounts_pkey";
       public            postgres    false    219    219            n           2606    18009 0   AnnualCraftProduction AnnualCraftProduction_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."AnnualCraftProduction"
    ADD CONSTRAINT "AnnualCraftProduction_pkey" PRIMARY KEY ("Year", "BreweryCat");
 ^   ALTER TABLE ONLY public."AnnualCraftProduction" DROP CONSTRAINT "AnnualCraftProduction_pkey";
       public            postgres    false    218    218            r           2606    18019 :   AnnualStateCraftProduction AnnualStateCraftProduction_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."AnnualStateCraftProduction"
    ADD CONSTRAINT "AnnualStateCraftProduction_pkey" PRIMARY KEY ("StateID", "Year");
 h   ALTER TABLE ONLY public."AnnualStateCraftProduction" DROP CONSTRAINT "AnnualStateCraftProduction_pkey";
       public            postgres    false    220    220            t           2606    18029 8   AnnualTTBStatePermitCount AnnualTTBStatePermitCount_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."AnnualTTBStatePermitCount"
    ADD CONSTRAINT "AnnualTTBStatePermitCount_pkey" PRIMARY KEY ("StateID", "Year");
 f   ALTER TABLE ONLY public."AnnualTTBStatePermitCount" DROP CONSTRAINT "AnnualTTBStatePermitCount_pkey";
       public            postgres    false    221    221            l           2606    17999 ,   QuarterlyProduction QuarterlyProduction_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."QuarterlyProduction"
    ADD CONSTRAINT "QuarterlyProduction_pkey" PRIMARY KEY ("StateID", "Year", "Quarter");
 Z   ALTER TABLE ONLY public."QuarterlyProduction" DROP CONSTRAINT "QuarterlyProduction_pkey";
       public            postgres    false    217    217    217            j           2606    17989 &   StatesCensusData StatesCensusData_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."StatesCensusData"
    ADD CONSTRAINT "StatesCensusData_pkey" PRIMARY KEY ("StateID", "Year");
 T   ALTER TABLE ONLY public."StatesCensusData" DROP CONSTRAINT "StatesCensusData_pkey";
       public            postgres    false    216    216            h           2606    17984    States States_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."States"
    ADD CONSTRAINT "States_pkey" PRIMARY KEY ("StateID");
 @   ALTER TABLE ONLY public."States" DROP CONSTRAINT "States_pkey";
       public            postgres    false    215            w           2606    18020 B   AnnualStateCraftProduction AnnualStateCraftProduction_StateID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."AnnualStateCraftProduction"
    ADD CONSTRAINT "AnnualStateCraftProduction_StateID_fkey" FOREIGN KEY ("StateID") REFERENCES public."States"("StateID");
 p   ALTER TABLE ONLY public."AnnualStateCraftProduction" DROP CONSTRAINT "AnnualStateCraftProduction_StateID_fkey";
       public          postgres    false    220    215    4712            x           2606    18030 @   AnnualTTBStatePermitCount AnnualTTBStatePermitCount_StateID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."AnnualTTBStatePermitCount"
    ADD CONSTRAINT "AnnualTTBStatePermitCount_StateID_fkey" FOREIGN KEY ("StateID") REFERENCES public."States"("StateID");
 n   ALTER TABLE ONLY public."AnnualTTBStatePermitCount" DROP CONSTRAINT "AnnualTTBStatePermitCount_StateID_fkey";
       public          postgres    false    221    4712    215            v           2606    18000 4   QuarterlyProduction QuarterlyProduction_StateID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."QuarterlyProduction"
    ADD CONSTRAINT "QuarterlyProduction_StateID_fkey" FOREIGN KEY ("StateID") REFERENCES public."States"("StateID");
 b   ALTER TABLE ONLY public."QuarterlyProduction" DROP CONSTRAINT "QuarterlyProduction_StateID_fkey";
       public          postgres    false    217    215    4712            u           2606    17990 .   StatesCensusData StatesCensusData_StateID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."StatesCensusData"
    ADD CONSTRAINT "StatesCensusData_StateID_fkey" FOREIGN KEY ("StateID") REFERENCES public."States"("StateID");
 \   ALTER TABLE ONLY public."StatesCensusData" DROP CONSTRAINT "StatesCensusData_StateID_fkey";
       public          postgres    false    215    216    4712               �   x�]�1� ��~�9��ꮃq�Қ�4Qi�㿗�JG�|<	 (+���޽@$q)��>�W����MsOў�|os���a�
�Y�+����P�JM���F�%�L���K�4p�S>m*LyecF(X\r)���K�
CX�#�e��M���[�b����X
�(.s�6;��lR�d#{+           x�U��N�0Ek�cмm�PC�(�ɮ"�lV�"���d�K���x�M�1�����_�4a���}�����+`�"Q����2��i����
����ߧq��7_?�M��s@ˉf�*U*-WX�Sbǭ*#���V���,�ɇ�!�k��q����Y���Т����g�\kN���(��çB�);n}�lI�r�LW���<
a%%Y����gZ�Cs���ʻ�]v_f*'y��tiM��Aq��|�'����W�`�vEڶ�j%��S�u���L         �  x�E��rc7E�u>f�w��.;��ےR��NR���ϋ��C�E |z����e�Y�x����ZM�x�g���Y����V�j��Ӗj��K?�Z�Ke���!ykv����W�-/�ڍ�~�����Z���lĹ���*#W���li����jk�n�׻Դ�F=�:h�j����c�D�Ͽ��tw�UKK�y�q��5���q{	�k���w\[���@�u�(#FO�nR�")N��6�0�������:z?�:�����Z�*F�+a)��&1�T�q��.�F��������KȞ�G]��\�C �bi��P<��|����BK9or�����)�������y|D~z�V�����>p��� ����!�Ұ�3�v#��W$!��Y_��Ѳu|]Ê�VǗ��:&O'5v�c��������?[̳�2��]qL��.��D��=��5����
{��U���x��={�l�5a��6��#��M���,�&�YJ�̈́=Z|6a���Z���sq���?�ɹ�Z[��{J�x�V2��{��}��=6͔��|�6��� o
T�+Lݾ�Tɟ�7� ����<V���U
���:�L�#����.�^���9d���yL��#����^�=�ފ�wŅ(wq�39����j�]����	{�Z�ȏ{H�\��;�0򗂑WM5	{��a����{B5	]�~tCؓ�ÿ��#�Ӧ�_�͂����M����uS����F�_x���/��݈ꦞ�ŖeQ��<��m���KԳ���׸q�D����m����Wmm��&��G+V���^�MQ���gS���Q�So=�z,$�3�=_9=��p-s1,L��D��@�I�/����׍�-���S�A=c����6��i���aF��{�+��{g��$�]���)�]o�!����.��m�.��I=�D�{l��԰7�ߺ���Д���{(�*%a�ǕZ	��%R�����yԨ�(��ػ�BZ��'��D؟	L�=��ԥ(�����/�!����)ST���)�����>��%:Elc��8=FDJM!p'�.��LԻ8&k�>mp�7��=5����Ő��G�����6�R���e΢�\��`��j�v��M�d����5�m�}-��K�K�Ȗ6�nR��M�G���޿�쑺I-�ĥGč.�7�n�U�Ҧ������4��R���<?b'�i�z��]��t�ق����W��s�aC�bP���C�U����h��g$ޱ�u3.�1�FVz�f���Sɇ�'S��?ע���+b�)�c3�]�o���1��ͼG��0i3f�7�n�h��{B����|��A��נxl�3?�.���L�\��|�ڍ�x3�/ָY�g��[�f�E���y�\r0����X���u1�V�5zL����R�=zx��N�e�h)z_l3��^f���k�霂��}�y	�'�&&�t��lc�G`���ͧ��}"��Ը>w���ǀ��wi	���`���¤!�S���]el�=l$sh�9m"2�~/vo�̀��[���ǁ��A��N8��q�0��{�!;E�{��Ϫ��3قA�.�B
�4ގ>��ͳ�'Rd�j�qE��%�h�F_�R0F�=
}q�|���%r��1�XJ�S�b�+.��;���b�ߑ���̉��=GS�҆���f�e]-���+ꄼz>����1�g��ȴ�"�Qԋ� W�y ����b+E�/���|�Zƹļs�-l^�nR��l�ż���8~1o���N�ϓ��X�ka��XAcT�K-S
l����5����'�=?<�����}��w����bά���?�#�=4Т׬/��D}��D��|X�z>3�i�?C�<�gx����0�SV7�ncJ�+�݅s������?�����d�5J�;4�K}9���¾\�x�����8�^�4�         >  x�E��r�6E��Ǥħȥ�������ӊS����q���h�#�^?�0�e���*���U�qv���n+�~.�v����7��{yU9B����Ӵս��9��M�P����R�F�м�v��]	d��`��}��dt��H��W��]���usR���\�%��\�Y�G_:�l���W��I'���*V��s�j�ۙlZ��o��b�;>��N"��}Y�޻��pq:��=^��~��������f9����u���ŝ�5w>�0�E,ޝ?��u��N9&��0U4��*]S����`�~�	���S�@��T��$�B����a�0�	5lf-�]�a��S�J"L8YSŨ�K&LR�'L�p&LR�L�D��a7�0A��&ğI���4�E!N�E�I;��XGq���
q�zY���q��ů��@��_ĩN�p�6'I�pҐ�Y2|Rl3q�@<)g�<��'N�>Nփu�8���Ԧ܈S�|^�ԕ8A��8A/K�?�F��|L���!N�b�o�.�a�8A={����@����?��6-�<��L����3��w���j+�B\�"-�ɪ�Է@���v���1�6�W� /�@I�"����
=��@Ic�&[��4�l@!u�z�>������dDI.�D�4
��9�(i�!�	�H�����H�X�T�Hf�	�H�X)�~�uY(Z�Nh�@
dLz %?��HAƎH7��X#�7s�I��:)R�F�7�'02��0��ʠ)R��������3�Ej��O<��H�9"u�$�;��4x"%nw�$�OD�H�E$R�t %2���X��"%��jߙ$.�nR�d\�����*���8X���A��w�hFQ�D���DJL��s�@�"%��c���d�Ο+�"�'�K����G����(RPg�nE�#�B��ސ��\��ru�b��:��&��R������F��y�9:�]$"�ъ����IiD�+��&��3��{�3RĞ��!R^oI��c�{0�H�A�;-�0)i@%R�z&R��H���w&�p�M�'�x�Icp{������Dʏ���b�)�z&R2;O��ܩO+ϲ�j���/Ő��J93b("�1�H�i�����H�=�
�Fx���N�
B�"0R"�bH��2R���B������	�V�`��n�>oE*L��)��!5��L%�R��&;Mb�KJ�X���=�E�D
G1�n�Ⱶ�^�Q��|���4�/�� O�$u�R0/|I��T"5�t�A����1Ǒ�1%n�2׶?n�o))/�)��Rcx�L�L�p�ʓ���I���'K�wc�Ʒ��o�s�ZDj�      
      x�l�ے&Ǎ����,·K�4�p�ݭ5����9���M�l̆,��Wf �p��珒�����#���g����f������Q[����U>����z>����sn~?׼�g�e����~6�g����>[����|��6��,y�^?׶����L����9�ӭ��^?f����������X�xS��X���n�3W�����Y>k��׿�?�Z��E�Ru�:G����4���#�:>���u������ޭ�����_�>�����-�1�T�����>��S�=}����'�3��d{�շ�ɗ���~_ʽ�b��dK��6�?�:V�qyɵy�������x>��ůl[H{����>�2Y�U���l� �S��������֒j��6t����Z��>�7��/���?����ƴ#4�mE9�϶m�Ӷ�۾l^=�)r��s䏵F�����t�ʹ�5��#�g������Σ�dk������3{�.�bk_�g�l�={�T�gZ��cٹ���O�]�=]�/��ӊm�}�Gk��ۏR���5>�re'gg)���ӷ{v�!m{�ʺy�=>����q�G�l�����Q��[������6{�b��~���>l�e�c�	f�����if~�m��q��v�ǧ������#�G��r])iӲg���nB�lc�1\�9%���/?�n��+w�۵��dKlk�c���q;����=���l���v�ړ�m����>�����H�'�c�}�zw�/�d��ls�b��|�V�h�_�@�akP������ky�Y&;=m��{s����WچՌm�oh}p��j��+�zd�70kb;�G��U^�-sYɌT�I-lXN�������{J��Q�����.V��ٿ��Y��a�n���{���ݮ����q���}˗���l���e�����\���K98���`oo�>'6w��f�m��-��v?le����9�!YYւ�R�m�ݓ��lw�O��2���~������%M�i��������>�|�����?��v��_���^nZ�|�_��m��sk��mx�*|�z_c7����G�'�{;��P^k��J\{���c�3�[��d�`�"�<�70��[����Z-:Zml; �/�؂����_�]S]��.o���8&t��� �<����.f���4�9�U�|�w��#w�2�)�_�[��}�~W��n�՞�<P/2�~dKŁ��K?��Ѯ��س/�/����`�=0KR2�,�F.�������Vo���|����̇�]���S���b�bg�^m�/�|]�\�-2�h�g�F�i�k�ܘ�e/3�J�ę���B��^ss�U�UK@�r���j�_~�e�3j`�q��]F�0���_��������u�̾Y^!7�����8L_�}mG�v�
'��Z2S48V�.�]����=�K�%s���^��������v�s� m���X�:9d���@�j�R>y�l�>si��Z�I]+\�Yd���o�K�)^|a���z?��a��Yl�̚�[�}�z�u�N.�O������h�q���α-�Xf��4`j;U��X�b�r��5����_~{;�=�v�ѫv{*kg��	����^�p�j_���o�r�i{�S̙�q�2�ή�o�`���yk�C�4�v�8��dي������7թ%��o����y-��<ܟ�T�E:�E8x�l�v��s
6���n�42a���� e앛�Z3~�;4��f���v�u��k������ 3d����m�<��?{M{a{X�Rx��9`�i�f�*��A�+��j��u��u}�-�]�ȃ��c�o��v �v�7��~�mg;�����R�3 m˶�����j��"{�ֈ�����n1�s�R�� {3Z��{\`_��f�����Zs��ӫ}��v�� 2r���_d_������}�	ٗ�հ��|����/�?_W�m�����}خ���y Z�{�,&Zf��	]t�Ѱ�kO=8�����j&���'%f[eĎ}�m���0�& z-�%�a�},������C�p'���	jB�{��g,�����f���v@\�pU�}�-W��U��d�3\�r�}��t�:�L����}(���rw���@�C�!�����_	h�Q)�)�>�r�D�/�Fb�/�/��1�����6�>�B�R���j�/Vek�Xb����+���w��>;9��#k��U�],J�%6����9�v�tK+�y��f���r��u2�v~��۵(���cs�h�]a0�VdXg�qo���$�~�|\�]~��̶9���o��S�0�9�h`�zA�=�"A0`�{\ W���֫��5����v,̷�|Q>��f��ol�7�#jKcQ$ǧ�����H�, Ʌ�f8Kgo�پ���R��_���B�e��C�^tX�8�]-����E�l?�q;e����EH����͑^��R,�����pSV�'�B�].����������d_$��{�|�9;���������8��{f��,���-���$.Hwئ�)�c�X�t��書�2>�?v�����z�����Ȱ� �B�!-`_�s��~cX�Y@�|���`@��Ng�8�p����=�Z�j��4�Ɛ���o��A�S ��~W�L_pM��y��~T{E;a�N�CI�aǷ%LR����t3��`�y2�%��ny��X���zrC�=�~�)��W�7Mx=C%�znk��<Yl�	���~"+ٵxؤe�~e�0dv��6��	RRsÚ�uZ�H_G2��C����X �/w��/�A0�>��^")�FF�Z�c�yoSYd�<P��K�o�_�_H�b3��S5�n����l�b��|�,rrB$Tr�p�v� ~78l�S3{��vɂp�+��(ݐ�
lZg��a��W��XTIl��D�ټ9
��#�I8;�}]�o8�����uX�:�^� t`�j���S�.���H��%j�es1;2P�|U�_�_i`�	�ɑ ��>�����G�J".V������y�3ޘ�B��m��b��j�oN~����'�\q�l��|6,�4���$�~?`c̪#�&7g�(��^qM<�E�d@�G��Wᡅ���2���͠�n�XN|a�a��+�Ą��e�q1��`~�:{?;�;�qy�� ��	���IF����7�ޖs4O.�P*aD�tu�����n>g�+�l1/�@��0�F&M��� [-�)/�o_�=���_DJ�ڪ��!����qH��	��Et�7���&���_��,>��89�aϊQU��'⻰�d���=?���/"]�N Zl�ر��
��_i+ g�����j�8�mƉH�qW�A&�����Ц��3���ᇈxvI�6��7G��%a ���,D6�����b6����*�b/�� q�t�m�#�ؚ�K��ߏ�*��RH��'.�Y�DiA�����������"ē��c8�]�Qߠ�3q�_���v:'��$�h�]�J���H�VE�c��������T@����{�kx�l����	Ow���5�a?\�};}3a��G$�$%OJ�]�o�W5���O$Jle��['�p�a�d6�>I���$�&�^��e����W�Q��aW}�(�Y�'T�@F��J)����IYO[�A�!K0��Al{�d�yAB��͖�}���E+JY���S�l���r{�K����$��пb�(Ƙc�er0lEڲkNVsR�Q2�||�Ӫt�+�oG�Y��$ͫ��~ʱ�j�b�����c���o~�Y���9��ɹU0y]{���RUuH_W�^�/�	4���zQ�>wl�>����J�� N ��T8 x�V��fr(������ͨ��ʏ���/f9M/�t�<s���U;�*ā�����D�\��δݛ��"�;e7��W�ӰL̘�۞o4c7|�,�$:V��������@��Kd`����m�<Ke��ęŞ�d��R�9�4���]���v�!���?_6�T�Ȥ.3����T���;�4��1�n�0���:���E8���� O:Q������ߤtm���q; 8gj��j)v    � `�q�	��p�2d9vAm]�8�APZ�V~F������Ō���	���u�ބ6X��΢�Ā����_��]"�m�n�W5Ҩ�P�$�C b&���f��<�kp��F�����c7�!�K��XI3j�����_w�����5X{�?����'���E����-,��"�����\�����&���H�ʘV�!����羰�eWeQ���6]U���P]�\�)�Z.�$�EP� ˪��C��0Hᚭ�5=��*��E��s�O�1{g��9,:����cC"u7-��;�v-Y����z$V���R*>k^؏�)��Lxb�]��嗚�M�q�����m�?9�]�C6r��c����	MĜ*dl��PK�ȟ����`RS���Oa�"�W�E��]��"2r8�(���y��ACP�dq"���ޡ6S^�׬�2�"Ld��r��)�Z� b�ؿ�#�we�+�YDT�2�E���w�qT�7���vw6s':��SQ}�r��tC� �\�Ϸٖ؂��4�B�~t;	��8j-T��_�i�ݠ�� �ۢHgQ��}a�혫6��owF�3T�}`�yy�+v"���ahXt���5�S]�ۼ��?���v8p�=�����ԄC���)��
;���G�7�|��^P�mӼ�\'�n���`�ߺxl	��X�x?R6q�;1Ȝ�����N���*�H��N|!�z�>���W�gbf���5�aF�p����.:�&9� &\��Y �P����TsƖOxPK�{h������ԚI+������v��	�e y����(���}!��Q��'ѿ�C�}�v��+�LEa#����s�ߔ���}�p��y�ɐ��z��/A�8����<92�^�ٍ h���rL����80O�B}�!SI�A���'�;h�ⱓ�Ȫ��6I���5�팝�D���FJ�x8F��ޑb9���?�Vl��H�Yt��p �+�ێ�XO.��Z����e^�&f� � �D��������cW�ݱ�w�;�� �d�M�� X����q0���Lx�~��MX��,04� NM��ަ���'Y�Q7���}A3*
��3�O�4W���Ը�_�z;� �A�J�d����O��^ήX?��V7��~17�*�X6��܏���=WO�6�nsu/��V�ꖐ�Rl�/ާHb�ز�|3 �ΰ�Q.�^�(n�d�O�9e%��pCV���@��i�+f�/��=�4�R�Eq�X����-_�5� � �^�c����/�o`_�DJz5��d�|�%0D��9����'	n������3��)w��"Q����46�AW9yB�H��Рt����nud�d� �)_ ��@?���3�&�Dr({R����E������/�ϗ�o2@���$e���_���)�c�KkI�m{�k5n;6I��R��P[����������0d�7���HC��*	�$L_怬i�x�;b0.�o*L�wcjIy���x���us�I�7�_�/�+A	��r���ċ6"g��~������#�,ǀ8�nѰ!��T-F^�߈I�ɑ�Y L*`���E�{�}q���ړu�<um���.Dp���]��ή�<�&<�Ug�v�0)�nʓ$�����!��.�'�M�b'L*i�T�����X/�[v:�-�Ee��_�^�d9t�'��I8_���@�TEXX
��)u!u�`0)�7�C�_NV旃�O��B���C�Ƭ�c|����)[vh�<����(��a;��r�: _�xJH�ɾ�
�h�tr2�Ds=	~}������Y\+����`�`�'��	o7[�f�@���jI_�ݶ����0���D�FP�4 ����@��Hh�Y5=~/�C�i;�o�|�\/��~������ȋ֣_!����i�)�ԭ@ ��V{�Ȱ����EG�[hShB���wub�HK�����I�z�%��l����������a��"��kᬄ-I�������� �6 LL�,랺{#Z�������.bh����T!��D.�E���}6�f�Џ�<)���An�l�ȲAJo�m��09�W�B����� d� U�� {�����|�����:[�c�$�4�0��Z��37��fiʋ�?�^�m�H�90�	�����ʊ�5t��|����O�A
[��.�e�mn��S��T�U��En�z7vdX�jA�r�"6
�Ts�*��N2L��úM�~D�]�M����^7�w15sy]}�T�� $Ňe���w�Q���W]�DeyЙ�@�� ��Y�13<�ՠiH($,��O7��hK��k��M��*� ���4��H�k^���!Yآв��c�7A�IJɓ{Qo�����M�cN��$��S ���N�Jfq+�v����.�y��	�T����I��Ab�������NY��9�����	g��]��!����X��k�ܵ�b���/�F�0�����)?
jY,��;p_�Op5�,�J�-�K�ξ<��m��B�0�U��4[*��"��	ꥋ3Hߗ�B~mO�X�Y��7��~׳�낦/��T�Ŕ�!ް�R��̈��{�������S{�-*�� Kya�"�`�8{��8׍m�'t��~ (K�U�_-�ϰU0?���%�$a��v��De�oz�v{�	L��"�������!��yQ�����!ہ,ZZ���r�+o2�aԽ��x����K���<j��{��p��lOM+S�k��snkNn>lO�g�k;i±#�J���BR7���+�Zu�)�n �bs��b}�&�&���f=ώ���M�����J���oz�=��I-4���>k[�U7�	V��Hk^��Orw �X�&���,{s�Q���Q�eyɷ����W
��p�g���z�u����bv��(�����~�^:h�����I�L%D�q@?I�Y��'�HH��Vl��8�ۀ�@�*;�p�����?L/��|7a��Y�"�����P�fV�s��yц��������H�wS��nO���Y����'XYs�M$3·*2��&ʃR/%[[U
���#�@T��j�FX������a����b�6�J^���-Q��mR��~x��-�>m������<n3��m=G�Ha�Z�ų�/�/TJh2"��-��� ��n��o�q���j׵s���wD0]�n��E�Z��������`Tf�� ���=�*�iԧu�w��,�/��X]/E�&
�b��X�uN�e�P.��q:���s�jM�Τ+9���'	)^&d��D;$� oڋ�z�.�޺`��]tō�lg��#��v��Ib���v*s�zQ���ܶ�L�N	~���>@��r$f.�]|�j�:�*�Z��M���҃�����,PD��:%g%L/�'&oE��.�j�&�<M=��%�l< �����hO�6|�Z��7�]�����H�3/�/\�;&,9Qa�ᅗP�O�^�\q�?[�aDک�2�Y�=1�4���P����//sGj�*��T���q`qW@ɮр�/���W���̭͂$<Y�)$��:�P�T�E�Ѹ��y79 ��ś��H��m��잭���f��������%�2��o:�:�|�(��?D��z():e�@��?v�w�5�KݧQ ����؊�MN8\�ݤќ��'�u�&J�NЂ��gC!e:��t�,����o�~"G��](�� ���V�[�}����<�T� �چ,��6�!��Q�-�\��+ �-�jhp���
�o{?B0���@�����ۙ߮E�4����`�p���떃s);�Fw$:�G��x/�:@�Z�I���~��i��l}����� !�U�d{������]:�J��@A �D�ׯ���ivN�^7 ����^�M�~'$�M�´����8џ�����w��ۙ�r��6;� V����P��pڤ�k�M����s�)��+l ��|o    =�s�V�r� �n�o��0� �o>�P�r��~2^� II�O%���u��.�21�K��6���3��ᥬ�S���EOP���wB�\l��X��4����35�b��g�`��gҐ���vz9r�K�2kl�y���95�I�&�R� ���;Į��&(�
8oUtD ��n��عU���"�P��a���F �SD˥#�7.nk�ȣ�C������(�5��9����_N3��A����1��ª���H����$tuTy�N[�E��C���^��k�]�+�m��}-OѺ�@�
��p\����ez1��x7a�v�
����������Nؑd���,l�	@�C=�Jj%�T$���#�^Y}�S c���zb�J��j�rB�ُÝj���7��a?���p�vR�7�덣{O��ţ��V;N	������E�`oa�+��fq�:� $�k@R���ia;2C�CO\`_gG�.G�b-�����Kn��&���{ް��WmIV��a�~��R	���&�Z�����"�����9�>2}m^Ŧ����#^y΢ZA� H�ITH~\��N؆'��x��a#l���#�	ዔoQ�	ț�D s?�:5��
��s#�&� �t��@i�Ll�i�"V�:��r�����F&u�y�ؑ�q)�[�fr_GuJ�0Zh�mI��Hi*��))H�t��mu�q%M��7�������EXO��t����5J�[U��J�T''��S�ZJ5Z� ����YY���Nu��u "�5��y�)O�{䖽:[���N�BYs1H��zC 3�H.w�sh㉠9��޻;�t�w�+�*<�E> (�i�D�"������!�.x:�=�t�$�r�V�j�'��N�I����WR��� Z�)zR6���<)y{�%���/���T��ѭ"�z8?fc�
\���*5xXK˰����������C<")�&t��Tτ|8)��~��J5�@X�@d!"|{�Yi��;l���Tu�+��B+���E*��.���� �z�������9�a}z���WB�U�|Clj�zS�K䃒���ɪ�Kw�Y����H�C�׭���<2�`CZ��*�Y92��tA�v 5|au���US�X3��7\�$��,f){]����g.j:kԮv���I���)�����=�(�Hu9D
�&M� 6���~���Yw���&��y�U[A0\�ڮD�E�8L�v8�ś᥆�([��}�G�f��wT� e��i��T��^zM�9��E�٢��+
���c�<�H�4�
͹w�h�����Pi��0��-�q���O�ǅ�x#��S��
�4guV���v̂�4�Tළ�F�x~߸�K\L*��+�i	3�6�2��i''��(�e^4/��D_v�z���GTd=\p��;ش�i��I��🕦��Ywګg��B,o�g)Kզ���^@� c󘊄��rq�МD�Si�S�@<� �d&�� Hp�%�ړF��;r�W-��H���2a7��@�t`7���RjJO�h�� �SR��	�Վ@�M��x�rx��"�Bx�߮�������*PCE���W��� $������\��L
b8�<n �d���'U��:J�w9''��߫p4����(F�v,M��Rf.(�:xep���A����o�N�h��#--���Uc%U��P��pQW*�l�����J�=_�uq�(=T�0�CZض�e�%i=$`$a��GP����oΪ�A+��J\u��K<Ʒ�b.w��ޯJ���Z�D�����*��ºM�0y�����?|��G��I3����0���X-����H�!���[���*5$")�K��dI顎*	�f�9���sݡ{G�ܰR�x�N^���)�� v ����=Į$&����),ם������4�M�*����L�Q ����(��g7�U`7��)k�Bs0�$�b��z���$��m]�OU;�~-���*J�"ʂ��j_�o�LD�-[T�3'�,�Kg���('O���k��e���e����h*.4/��IP�4�%Y��E�܁��ި�n��)���S3�!<�8A5�IM����~
�{Il�V���`�.����V�B�	EE����C�Q^W��6��o�`!�U�^�'����=��q��'�p4t��R �T9a@O��;�x?x�N1�ޕZ��>Զ��Q���*�{��$ҫ��U�R���e)&$PY�8�G�Mȴ)��лHIc�)ǟ��l���Z��~��*i��AA���:-�}R�z)�KC��⠣�Ӡ�{�C�Si58��ڮG��~�,_�?SSH!\����^W�fٞ��_a3Zb*�d����t�Ȓ��2!#�.�gw7yI,wò޲f>};ٰ�Z��c$� VY����z�3V	;N�/�_꺳���bs�^�R�/��j�����kK�2[	��wAa�
���׷br��{g�,`y��p��a2�M{�~;��>��>9���G|z��Lʤ2ǒ�5̻=�dRw(ݐ�w�?�(��w��g�'N����%�d��܋A�"J��"�m�7�Wο�_;�d�A��7���i�<IF�d}]�����n۩^I�[��t⩓���E��%��%��v��(I=,����h^��V�I���n��Ap���1���b��"��BV4�l�7-�L��W`n�a����8�����wm��4���x٧�P�b~����2-���f+����)V����KXR|o������U*�۠�����aA��Wʿ��8{�C�`E{n�<���j���/��횱��w��
5J��z���*��}�a���*YG~soir&o�X�͏���_��4�z�\��dᡀ�4*X��x�48��N��o$g��\�����C��� �Y,{$�Uo����>����]�~{�n��.��GS��~�C�n%x��!�_�WW���2lLt�� ?�_[:��w�S��D͖�)�f7�J��5�-Tw��;����?}��z��.�%��?�"�E}"Ś�>�����^)�H�h��?(.z��;b�ҙ{���m����S�_�cxp^�]A[v=�	�D��_X��* �m��r��j�<���h;��WX^\p��vݢ�դI4S<�%臘��TMh��5v
Z� hN�j�y���Za�PA�)��`%�=:��zf���s*�vo�Z�T7 }��xĎT>�Vbt�@�~�-B�϶}�2�U(��gg�Pe�ᠠ���w�ų'�4%��m�0���(>��k�Ft�-	���
Rw� ~?x��� �4�!	��i;Oy�'ǿ�|����֡K�u��Lr@}����i�>=,�P,jM���h��=`����;Uq6��P�3r=iGHH�xk(���|�iM�m�NbIUj�u�ݭQ��b���C��ñ�t�B�9U�xU�O�bc��I5��՝������P9�N�X�'�c� '�&�՟67Վ��}VG�#�S$�����|��i���p�9	��G��%1����/7�
%���Vb(��!)���k}g~r$E��!0�ZŐ���X�a���6�Dl�u Z6�F��1Q}���^(�o,��[�|�t����ѣ��B��1�n�4�z�U�B� �Kxzz.�o�ي���FIFu3.U��F��P��n�%}[��Չ��O�9��\"�L�H�fJ�fq�����d�"��艓F�d�Y?�ܽ��JB��]�f�8�������HeW���
��~1� ��������}��vp�J��hl�u�L�Y�/�`=�7m��!B��K���GC-{� 2���N��#z�3���u&�@�H�5���"�<��.���������}ٳo]�KP�(�Dv(	]��"E흿�m����i�>��Y�C����	�i&�ɕ�G#/�� �s�l���%�fg�3;Mw�K#�������� �F/�U�YϢ    C?C���!E�5)��p#b�C�G�8>�l��1�ݼڬi��z���.�����@@�s�y��ٯ/�aش�Κ�iDѥ��w��d�I
��"�J[:b�q���s5[����N�mj�pJ�Vi�l3l�0?�>�#���c�v��"��Y�@h�H]C��Z�Q�Q�`��e�ޟ9�u���R� �p�WW�9H��E��N������W���Y�p��+f����	��h'�3x�l}G����|��Rפr	�ܭ�#{Ɵ��@�e^�/��|��2Imr.� �g`�vA>D��=i[3?�<zxՔ����HN��=7Ӗ�\�����BA�iw�*� p��ESt����'�l��E�B��I99�:o�tIa�{�����ҟ�������Ο�>��kߦKuY�3]��_�������E��Y*�2��!�$^�?�7�p�)$&
EL�R͞t=��|t�ے�W�˅�����n1�h��=0�Tt���zq��cM��=9P���;��A?�}��C-�X<B;`R�bW
�oI"���z`>ad;D���CW��#��2^�jOQ�g���魇�إ�,�!��v���|)�'�̣ί�/f�R�!:�D�o�X����.� ̔�c��T�{2�>���J�������ʣ11��q�'ZU����һ�j�\#�n��{4����K�r!?lO��tO͛0������3�ʞS�)����}����P3�O!�4�ϯJ�.h��i7�wPk�z�9m�Nr�D<f����f�������ÂV��� �A��I��#h8ǖY�U�)�xt0�B�qq?g���qe����͠��/������]��:x\aI9���5IsC�wG��^��o�/�W�r�$����=W�cq�F,q��{�]�H�N�cx!}��D����/��K�1�t0���_�i�uȑ�� �5��~:|�Oo�uO�mB��Z���f<Y��K�0�����z���ܪ,���ӭ��*������z��Colf�a�n.�_���]�7��*ͻQ��s��p�^L�-G˜�,���/�ݧ&;fș�v}W_ڕDϔ��d�2$�2������c!̃��v�E4A4�BbL�{B���b���[�v͢�K����	�cޏ4�r�ؿ���V��:�r���$5"� {���Q�n�z9�I�z����D�$Ue�\��wI>�K�v��I���)m����N�� k����x�n��8ܟR��p�hb"�Ϟ�YC���5�9.�M��1�p��]�_<?U�~23��$���>���]fW;�b����j��K00y�IG��j�>T��R��z?�e�)N��0!ۍv�:j)��`e[��B����E�gA�(TU� +Ӥ�X��hj�'�X%\T�.�Wf���r�]X���>mX��K�p��"陋��$�-}Y�����s�Sҿ�>M������Tm�����J�{��_:��y�p�����2m��ga��k(����q"_����$�x��i<�_\�Ҏh��A،���<}��E�U����M;Y������VT����~�~�'��:(2��3b�ns�7$pN�_=�ؔj0%==�S�2Tֲ�C�Po� ��NȺ��>dm3��k����ܕ��ӡ�w}-+-|=��(o���!9ngz�u�ߒ�:�hkU/Jﱎ�����LzIV����p1Qt���Kq�D�f���*�2��*���Y�DV��嗪��U��"Lj:i�4��`����>���1^�}�x�s�*R_{_9~�& H X�H��	�q���
	�.�V}vo҇��ŷ��~h�RO�d�|����IEVT�J}�*�ELtq���J����C7��9,��IS$H'�ԅ�Оj`ZM�R���ŵ�*�~������U�y���P�RSۏ�n�RP޼��Y,ɳv�D*v JF�s�s$b��Sa������
9jL�6��c�&�i��%�4�r ٩�w���Ril�(�K3[�ƍ�F5滪����1��)J$���?Z�5�eJ�7�
*�pzа��Q��&�g}^��Ϻ����U��y���8�@h�<�5o?��	-C�q���V[}DPÓw�X���a��|W_s>�b
�"D}������5��~ ��Y��c�TM֨,Y�j�z�x� �v���-K϶m�>O�U|T l�z�?ן�'�������9�rT�*T%~����H+L��?_d�ϋ�#J�C���b\�S�?I�04G����E��W�n"����ˣ[T��]}�h;��~�~I����$2�n����s\��QO�r��A�+��~1��S�-�ٯ�Y[�jߍ}7^�d�
S����G�R=s�p)$���ޢ���.�ȩJGVy1U�IN��n\ԯ>8͋��R�����[�r0�d����x��?_7�~:IU��,3��c"?�l�(䊗����}�OQ[zRI�978�S7_�_��wO�3 �j�tRo�$'M����x3.������]Iﳝ�>h_�O�F]�LD�4\�eR`!�&o�k�2��A����5�5�'m�)O(ƶ$�ʈ�uz��n��2�j������"B�P�}�mӖ�C$1���&�����"n[���%��|���GF�Ѝz������zB�	�V٥Y5���Gd-��BƁ�v[D4C&�F��W�f�s�h3�.?ۚD�u~�tޠ������;��S��s^����|a?h�ȩ�����|f0W֨D�'�Uj������tI��LG�$�\-������?
�B)��PG6�R�4�/�Wg#쓓J�t%��E�B8����ѺcSЍ��ە�Ρ( ��*�F��z1?��}���zE57�c�:5����|�S��o۶���E�O��ϟF�g���W�~��hڃ�	rr��m��ܨT��8$-��]���w(.��i"�쬙v�����;�=�������S�@������Z2������;4/o+�w�*�2� �K�2_�.�}"S�5ź8�Q�-8�Ax��;q�̀(�L=��G���tϣ<�T�����	Y.@5x��Sx�!C(������1� �E�Q��`,�X>�W��J������u8��{���rdФQ�I}G�[�zY�ey\����XA�m�T"�N�5r��pP����'�ʒFmR�Tjڹ�E��8��hNt��A�a��J��W����P,i��cСk�&g������$�Ҷ@bA�F'[��e�K�^p���f�P=��IZ�����zZ�qc���H ����G���wQQ��;���P@�ĳ���MNC/l� f�V42g���Ӎ�ܼ�|���u�2,�-���f�-2.��J��&�Ŵ�%��ڲ҈���*��_X������I�c� �et��eM����/��ץs�C������b���h�A�I\���2>�\3�*��o�C�!�RԀ�3(K}�����<Z3����xƺfV�	��C"[,PB�Pi)��6��A3'�O�Z�%�f�Zwq����po�����$4wlH*��r�Ԕz�S��j:���e{��[�'�6�j�@��AU[���|BUZNk�ǐF�6�j>k�4�ډ, ��H�晝o���a�#�f��W��c�?����n��HkuW'���X�x�F���>��::�x���ԭt�Fd�c�l�^Y�U����D�� Z��i��t�˛��߳�uv{��U$41u~h�9�]D}��a���ՊV��E���
0\ԭ�?2$+Fo9����Zl�X��}f!\?�Bn���V��G�ɩsM]�=�$�(�i@T����C2
RKQ�9�<)f����_-j���.�j�d�s���/R��t��А�:iGX�Bn�Q���V�oKJjVA�hk�U���0C�@�t��1/��	*`u1kHz�-��� ���X��v�.�Ɗ������/���(ˀ���MԿ�a���������P7ᰧ��11�����
{�d*��r�{�g��.V5I��$g�'Ҕ���,Åׅo��9�����z�IS�    �X�P�>�#��掿�} 0ę�}����KV3���8�Hs!�5�K��3Q��GT�W�|wh�ģv��k3A5���N���y�j�ou��V��
���q����}5���)-)=�E|��_%U��2�
e����ԥ[Ĩ��";IqW�_S�����*����b����%���`�J3�Vʢ۱��9|CAO�^��a�_�U/5�?�d��p�8ǰ���9�ÐFM� �KK!��q.ꮧyTeu��J��31r\`=���r�ۈ�,���N��.)B��������2ۈ�D�,��v��:�ڛQ�R��c���wM���Y:�y�Ç���M��������>��*�����vL��J������걩*[:Z��D� �z.�0�]��-��y�!�e�J:�'�JeW��$Z0i��k��s����|z�%�m��:d>4��������hV&�Z��*�E�H}�{�L�O��e9�;��6�%��p *����F��:�M��Ε$�C���A�.E��j�)�x�!�xH��F�닫�n0�������"�s�|�^������t���A�d�#݆Ao���8琙e�������d���GZ�woj�W3�f����vF9L
)���F�OF�����kI)�n�t���v$f6�.͂v�S�e�b0;^hd��?Ó�7�(����Byt�@��5�ꏿ���s���K��X+.uW�V�h�IN��mF���R��v/�Y�Fr>�i�	�4���c��5;TD��>�f"@3�x���s ��!���tkĞ���i^d@#��#z��%�ԗ��)�-�q���p��Os�`����D����[.�$4Ha��4C̰?�%��pu�4Z���dc5�,����*���*�ת9��yHY㜚z�gq-�P1�8G"�ʐ�p$-����I�{*DG��V�&�H�����i�~_�����H�qHq-}�Z�!��h>V<i\�۪Nv�b�l��n	8G���H~��ղ�:A�ς:C��_̇w�SBlMVa�-�5���n��C+��9�����=YH��re���iR�CL:�FSݺ���H��m�3n|Y�؄����T���,z���5E#T��X��N>�ƾh�r���K�B���?G��*5eM��T���>���os?���*y�5�0;�?H�2U�bzN>-�NfSŲ�v�rhM�����m5��d=��PT�P�c����da)ڦ2/>���I�r!z����������;O��c��>$'O��i[�ȾD�Y��gs�&~�H�+I1ʅ�D6�}]�\�v[�kT+S��P7���%��~ǩᩒҪ.ϕ��{��8b���D�N�!X����B����$ib�O�M�o��3ດ2RZ[��j�[�O�����[�L�Xu !��݆)��X��1�R�,��T���KM�O�cz� Ss�����/��.�1?5��&�.�/���X���$:5(+����n33�_+�x�@�FV�L,tf_�}�<dZ�es�d�T����m�M)J�b<ٕK��H�%'5�sA����c���x��:��֢�[�A�S�"� l��,㶧�Dն��آd���� ����_� ~�t�X�#W�!�F2;��L(R@����^����UIX����zsR�T-��!���L���i�	�m@�7x��V��?/�����h&K�}H��?,j�bxy6���<����
���{8%b�K�5�\f���q���s9? �m�׻�\#;���V���.���_H\iJό��y���6.˩U��才ʄ�P�r9�&���{��J�^4�;��+�*HB�܌��"���o�Ae�,^���獁ў�(74���4!童�:��'��/����ø.������Yhu
 �����؇�VL�Q-�ࠖ��Q{S���:�1]���O���ê}�VS�}��&��A���ç�%$�����xp���k=C���(�����}z�.�Ԣ�i>��ј�_�^ܪ��֐No�|K�D����ߚ���<��u�x�.qD�&�wby1�QȺ�r0�qX�H&���^ϲ���ԇ��f�L��d�B"	,���Й'ɪ؈���$0�y�&���zz�>�C������|uEUe����*��ӹ��*SoXk��ޞ7IJ�vB^,��[�A �>PW$q�Յ�ZQ��v3�flA�x��*����e%��"�q�)�ߴ���__ڛf�l��ͺ�m�=�?�dI��v��׀��J�����M��d�I>���
!�9}�z�ߥչfY�IB�~�<��o5��Q���|�>
���1�;π����P(�5Mg��UL����O���!��/����@7V6���'�툚Te����H^�6M�CU�U ��m����+$�0�I.�|Ax	LH��t�B�aƪ��ӡe ���� �h��,���X����MИ|S� ��LeL�D���Up�N�]�rѡ�/~/���s�x��!��������T�ځ�ˀ S]�Cn�x��]��zr��Y�]��X�O�]k�^�.��1��H�}���j�^$	��]R��D!T�̩�䭅\�lЅ���(�]��s�ii=�tgceM��wJ$q�<�����`r�ӈ�*���h^FE��6CSy��<�͸Kҩv���y���?�md�����"Κ=FM����7߽������p��C��g����8�/�?���*�Ͱ�46������2�̴.t�憚��X��(�)�:7�WKS��{	��R�Y!V^��(�RC�+G3��C����K��w�#*�3��)��A0ʧ&�Jk]��B	�JTL��ۗHkK�Q��ghY��-��B�c���՞6���e��!����}�Hg��H�$�����9�о4,�wO�i�Y�O��_��||�̍�z��/=�*3h�O��Wx��ܖ����s�B!����|tV磂��[c�Y��%����{B'��S�C� �Xi��ٞ�jh(��~}mm�����φ����0����3P���~�d��du��&���W�(&�)	�|�7�Wx�E?��wO�P��'=�	��A$K�W�|�H� �!~��RҘ_�����ёNrP\����#�裇#a��@i$�j�0��m'U��~��*Ҋ7�mʒ4SR���"��C|�b�ow{���38�:L��4r�P	��t�ë��h�� ����dh�1b~(41o^�����L���ȫ)Bc�I�d����s�I�}��D�4U*D�c���ߢ�Lɻ� �`��t=U`���B�o�zq�Ӌ�_%%8�m]�o9�1O5:����=�t������%��f����S���Q/��$9�����M�14�X���J�MC7h�5�F�ĹHM ��u�|[b��h(Iza��:�U�QU��w��i� ��y�=�B
 �5�����œ�ӭ��� ���?�/X�ɸ.Ɯ���R���ئS��*w1[��s�'�5s�j]�C	i����P������$N;J
LV������
醓)5�앩��M�yU���Cp�mZ�dL�%��mK�y��C%�ҝZ�������t� )+���V]�}Rp���9���������&M\ͅ��)��j�mzΖ�H*�E f��~���2�C�t"��E�_�,�ƍ$�߼��b�C/�=��T"�U<�t~Cj^���i�⷗��s�za��y����0�Є�8�&a�߮i�д�۱h�^!(�ãw�}�(,	.&��D�3��V�����5��^���/�n������Q�q�4��s�����I8�2�Dk�.�Q1l�����̖y�>�0fxH!O�|�V^�V�Ź��e�Ic��)3��<:e%S�z����قa�_'0MAi��HKo��7%�uY��\h;.꜀�Q_��f'�4���1�'
0�Mo���DЍP�mvU5VGŨ�K�{h�ȚN�����ȴe��.��u���>*�����'�z�"�"��̘����?��    IZ��M�ӽ���*Ud���]�/>h!�{r�%%�d�х��yp�M���d*h����ꂗ��C�����YMb$m/�КH���ԡ��C��������O�v����k�i84<��v�&V�L*��t���E�\sE�""�ov6iW�h�Y/�w�yFqX:"��|Zi��;��>z�s����5����`���L�u>r�C����QI͙A��9��Lߙz�I+̏P��o�n�v}�������bO��d<��9�@9p�����V���V�Q�aHB����Acn�/����W�����:��T��n�)<=͏1n�|��3�+��^k+*���)��x���$�����9��tB����NY�O�����}1>Wp�{
J"��%�\.���{mz��b|�-��pk'���ļ8�^f����ow�UK9:���x}:	ͱ>�g�`���[�<�)��(��lG��f��.�3�q5�ޅ\�����&}�bm���M�b���8ɋ����5.�o'�>��Uc�>X�CLy�@���=R��a���&7C|�Do:�]��k�Y���X�Pb��5��~�g웡�n�GV˹�v���t���ר�_��]F��aE� ���MSWѯC�͞�i5F��кh���tѦ�̤�� `@uH(^����i��/�ojw;��l��5Q06C<��s$�gӰd����,i�X��{���=r8�]\"2�jF$�R/��[��M�#S��3�@�ב?f�����w��Gt�K������HᶚC�����E�x�~��˪/I/�o�}BXw���#��]"����e�����_)|�iE3�� ~�.�2�v^�K�	b̀CTe\|/]�j�ǽ5�nސ��3��`+��.�Dh��GR�Cz�	��^-���:4.�o�3פj��N1�-d� �`����&o�h��1�κ�c�z�$O��;rt&w
x4�i�6������Ẓ��wI����N.y��^gl��Ƙi�rh�6u���V�J4(/I
�uq��y�ͨp��0�	4\�~r�Yl�_:2RM�D�O���gg҉�"�ڃ��I�/3b�����Y���R�2v��~��r�V��
�#Һ�g���?4���U}�_s60�Z���9/�!�?p�wL4��&;:����]�0��@=F���g��gtz�[�KFF������lޥL�֧�<k��g��AtK�[K*"5Rђ��)��;)']čL���������G\�߁�{@}�!\�o��__U�0u]���F�1��5J�p�s��;�Qňũ��@dd�|f-�O���ݠ��y?w�����ߖBB��g�RS� ��+���"m�����k����1!ܧL �Μ��`�T]�����k��ľ'��f��-;��R
����2\kBD�Þ��B��'5�5i�G�K/����8��'}�^V��x{��YKH�Sa��}�͛U��5�zدӸ�g��4�N���gLs���f��"�C���3�>FQvz=>��ãN�Bc>v��PW[���0K��/��g�� �w`��f$�\̄#��np����BG�Z�u2�SN����"�[�T�Ԥf�/�57����~��5�'MҔtΝ��lkh��ɽ��8ڑ��]�KZ�@X����Õ�D���>����@R4R	��RYb�d*V�S�87`y,%�<U��&>dE��i�����s���! �&�,���d�AH���W������@���i5�/M%[��d�5_�B�#��t���$b"ugM1j��iy�5����.ג���)s�Q�ᑒH�y����Tݏ�'��8�f���9����6���i�ji�5=.Nh�`!>��I������CS4]�V�\���N��O�q~E�ݪ��PZ��a�Lh���3���2�3�%c�%;O�gOJ�ܞ�V��nMN�Q6 h�p��!��G?�d 㒒f�q�4����)���P��
�8^�)��?���0�nxN9�G�=�$LͷÅ��}P5�j����y���ì!��v~ymNGD'��dyq)'��k+6ZZ���8u������'�5��K<uK+�q��߶�:����G�qH��H$M�'���7F��uH�q�(����9j[a��Ө�h@�Z�z?9[�y5 � ]��Q�I�����>�E�$�Je�����O�z"袩 �?5��2��s�l�9�e-�FL]1-��2u��뿾�v]e���yF6T�x���EB��=ϼ��E.�iaC��<����v���	7u�q!||F���y�����:�9=u��Bx�{�?� e��R�i0����AtU�j��Fx���Ԧ�-C��³�����g��'�{�yq�.*Շ��
]�0���07�ST�~8t�Mچ<�>�P�$̮$S�@d����z�G*����;v����R`�,�,y��?B�� 8�x^�MW�6�>����a����M^�Ӂ����l`pp!�h��޸]��N����X��k]H�&& �3����Dai��P\�	ܕz��$䳥ޚ�b�E��0z��\-_,.���okr�(�T�g�P\�u�Z'~�V�����R)Is����_h�B.�M�C��-�Q����L(�E#Tы�ud�8���_���~R3�Ȉb��F��/2��ÌN"Z��0%$M�ډ�-H���q���aTH1�e��hM*~H]�ç��t��G��if0j!���\��O�ƴd��+
^@n�iq��b��()��aF�xP�Of�?��k#5	Âp�qP9�Ю�K�x���s����E���4#iƣԲ�(���`^��=x��Dcj\4�,F����3��{1�M���jl<�BNE5��8	CEO�B��g�����?HC�����3�z�^��}��E�`1���Qp�ud�$$G�a� ��~m�(�� 	���Y_�����(��3�J��v�0O�/��}!�s�h�(�Hs~~ �	�袬�t���P�2�^�u���z��@�c�59�7�E������*8U]��B�$0���2�Ru7XiH�e&��|�������`��p�F�f�i���`^[����{��h�~��h�!�EZT�C���e��������6�<�t�~ή>ڷ��=[zJY<6o[�bu��}���(�ы4�����E�����
\�ܜ�V ���Ӧ�O��DjS���j/\�gJ�t��6���?k�k��u�&�����{Y�''�#3�I�)��dSAz��E�E�B��sz�ֱ��ⷛ�R�3�t+��v*`a<ʮէ���EV/�k�^�L��E��giN��~��N(ha����k����}����/��@���fO��k�}�_$o'��ء�[�uJ;��/�H�НI7�oM��ئV������6��9.pW#�(U:�EH�|��Z��h�9�������:���UU��.:���V���[�ef�u���x@��cIM��b�8}��`�݋Ħ:����p
Y�e0�X̩0����f�C�
gP�x��h���`L�Ө�����d��W(�&p�n���G��?�$�5c����G�1�cĔ$"�r�;��|(�Q�ʧ*f��BA̡7�
���<Z`�`�*Ø����XY*�\��+�"�u�/4� ��n,oC�I%�u�W�M%�8b�G��V�[pN�y�h��@�6bJ�����H� ���U+��U�Q�BX��O(-�Xy������U��.R��jZ�q����#�^�'������,M3w��GF��~���a��$�w��86=#R�'%�ҡh�Elg��^�KQ�;îih�1pk.��߭CLɌ��|����Ě^t�GFS���#��*�'����#{44���i��������I�"_�R���w�1N�-̙��"K#�څ�R-+��g��mY4G�>�UCh˾H9ߺOQv�B���q�H�ő�P6�tC]��O�����&���>�HLc/O�&T    ��t�,VQ��"wȂj�"E�D�����A�M&���F`���S��H�x牪�S��=ӻ�P�n���vR^'�����yC^Dm��̽���԰E�̩\�y�Ц�k�jhG�Gb�hZm�d4�L�x�������u�"���I�Y�4�EmQ�.@�P��_�ƴ���Å_l��U.z����x�G �z�۾����_�RS���C`4���uf�����n�"���jk�<G˭�J4m�����ҒhۅF�tښD�a��s������ϫY����	OF�՜�wQ<�B�'���� o������R�<�`x��&���zBK�����_ڝU���\/b�H�da�dמ�C��d�tH!�%�J���^�SJ,�o>]`��Ö���9Ċ�|�� ,�^�����Z����;�E�����D�"�wD����}�����H�}$u@���fc�Ȟ/�L�,������t�R�+"LXK
�X.H7'�j@��u^����L
;В�*���
�H���L���XŹ�͛���ij�Q�ԟ�T���gUI��
Ă"��E9�p��zwH�ߧ���3oKG��d�ؽb|� =j[茡4?��ttt>���x�H���+�sѓW��)����%*����	��U(��KD��2�ހ�V�����i.���������)�)��7�Eu��?�U�P��y(����W��ּY�B�KƗ2�x�]3<B��*�k6.�~!x�PI�L�0�f~���lp�U	>st��U�r���}��:���ӕ\Br:���.�����Zl��~2"S�!���BP+���n��x����1��4k9N򣃶��7͒�a��땔�o/�~< (���7�d�'GD���x��7I�t�o��Cz��{,�˭����莧�5�xE��ˣCƅ-�C��;c��B�6h銪����*=g�x����h�������!���f�3�9gJ���L�'�=��/B�b ^)�Q-8�y�#�wC����X���DG[���w{4��:�q���_��!��U]����6W/4ڡ"i0�?^�ɴ��9�N��\�3��Y8�߲�1x���;�N���0���R����[}�ʛd�+����鞝��S����0�ƕғ���@׭���Nj:�aV)ƕ��R���$�_S*l��A��Fm�����5_�uRM���J����`���H�8f�C*"(��U��G�q�T؛�/`o��a#�z�꽸��]�|Z����v��S�����oǄ��I�e��."�7i�C���]�a���1I������հ�R�J/����#-��m�����>'ʳ�ug��XEy_!���'lrE�u^'C_^P�U���J��`��s��Tc=x����
ղ]��hyC]�d; AiČ����\4�[]����_�W�U�14�����o�ācB��.P�9c^)i���؞�n��K�@\J����LH�E�db��-��M�X����"X�G��s�-@���t��S�M?0���WT{4��s�wI_����!}�yM�E���9��=��!Ia�Ġ���j/���J$)�������\=�*�m�Э+��/����T/�2�>�^8:(j�����w��x�y���_��$ m!<U����ck:���}�ğ��^�4j3sta��s�f�< ���(��~1yS6��vJ/.�	b$Ii��Ίaf��n���3��["k]"dނ�\dD��_���8\
�U��X%T�'uJ5:�%K9P.}�_h�XC2R- w��n��|E��E?8���"/X��>�
3^@\S6�P�f:4��D�t��9��ݒ�� �>\��BRԜ�jإD���TL�+�䅮� Są� \���(q`����}2b`pIye�Q�q�0
>�,K��,�}�>�F�xgb�Y^?�5���kd)�h�PuK&�$z�U��/�-�'\-��9UoI� k)�3��=�2YSL���5N�ȅͤ#C�Gj�
���zi�7���5?�e�j�1!�)&��	"���.��X*1�����(��E ��<�yIIs޶n���4z��>�ڵ���Ws���hA�#�D	�
<�S4��zXy���9,�7�g���X۟/�8rl���r�{)G��Mz�Ъ��W�C�������L��*"3W�l��1\g�<?��{�%M�t��e:��Y�4�S�H�PhL5��a��O���+��
��s�����#�:����c�S�;�&��ڕ��������F'i�s_͔]�:\&��r&>g�:����^�ɓڇ�(֒���t������B�� T��')3	�А$�-Ύu�;������o����HΫ��+���4_#���F���ܿ���D��#3�e�\ItԼ����(���Pr��L�]e%�<��!���j%m�i���d �!��W$r3\d�ۘ߱4�m���᥄�@���Sf(Y}�Y�,��>J�dv�(�T]	�rTߥܚ��\̙��,�Ƕ�]�(�x5'�y�t�`���n�@DYe����C�������� t).�L��g;ȉYB���R���uE��{0ٺk��,�,-�%��|;X_HF�����Q	`��`'+�GF\%��'I�u�aJ)65!��#U��&n�`�4�$�7Z��
Ll�t�Y�X������_�M�_���V����W�SgJ��k�ܖ,ɉ,��|L��Gl 3f�nlh���;Fk�$ש���N��PH���E{9�\Lz�Q���7��w.��qծ��.�?�2���r�`�]���h�G�C��{�4
��]������gC�bv�s�G���b��;]z��6�O�J���>���p��~��WH4��S�ɩ���@�>�J���j��\w|�8�NG�:k��O�[��Aڦ����m��dS�-"g��B�A���%�f4i��L��K#%�YP5�flS(���A�F�U$�AQ��
���q��hQ�*^��F���$~��~�*�iz]N��{)~�ƾJ���"�6ӓ� �~�GQP,�U#Y�S�I��L��~�v��]�`�~��/%�fJtz��:j�y;�۬TA�P�sY�EO��cЯ�G�䁋Ņ�7W��h�	���J�E�*�9�F�5MRy$�8m�,�Y��pҚd����su"9�6I[b��[�
R� �DLA<3�.7����&�֍b�EKl۾�|��l��|���}4�8�c��������{JÇE-+���n��0�!*���jzPȮ�F��Q��^�{|����p�Q�tB��҆%���R��ð$0jX�᩷���'������v�z��dX|�zZ4�y������#^����zZx�����ٿqae�y�Uc�K���6��C�܆-i[��i��q�I)��|D��H�7LRh$t�مɸ�������*�����Q��U�QH�iS��H�g�`�h�����E�87cz>�ß������Ӓu*�@���yN�Kg�MIG?���&��
��x&M�Ac��8���\\9�YV����� I���_)�L=àp�	���	�[k2]�芟e�<�����:����nULs���]����9�i��!�Q���M���ԇ��B�_��#\�tH�t�M0L"<��EJj8(,���n(E�����;�0��.��e�§�(C=�M0yW���IY�UI�Ia4�,<��urO���)��#��,��@��>�-��J���X�t��������W�_���_Jd+�Gr�Nr����@�u�����A+�$��<�U��r��84�j�Ӯ�����2�/���g��Z+\��|����|k����g6����H���=OEW�gh�0E@e�ɂ��ߧ�J(8���0Ŕ9)$�2�GU� X�}��ȕ�w�)�;(cE���y�����s�D�u_ŋq1����[ffv���6}� �����6oL�ݐ�,�CE2�!!C67ՁQ���܌PM�X�5� ������%���6lR>"t�����N�p>�~��O�    =�ܔ�����hB��� �D�}�D�~L���'�!8�>l����Q�=׺e�Rm;.����Mt�Q��Q�R�`M�m�d�h���!;VT�9�=@�Q��V\��B4`��}���|a؋9hj->�$�t�D��F4\8d��pw�u��CW�1݄��3k� ��k]<ɵ��R�{H/�*��oOfXP%:���xٟ�G���~��Uf"�1�+�����\��ߚ�����Q�G��v**b��!}G2���P��O6�!��d�����ؠ���(�:�T_9�- $+�%?h|���Mw$�q��mқ.E�`��Am��L��Da��4ʴ%��}���W���`d[̹:N�=���k���
/u����*m�i6G���ɖ (޺E���&*��!���_U��:�~���@PU8��Vmn�#���W��];{Q����}XK���%\6Av�l�(|]�S*����V�$?Ժ�ɦ��|nv�f�+�@_l��OB���n&t�*�,5������Ō0���w�@,��2�H��}��R�s ��{x�wo=�š�UQ�%?V��$k�.���R��Z ������kRE��N�L��z��ceG�2�RCGL�˹)�J�z�MYUv�=�3$:���R[�E]*�8���J�N����Ͱ��ϊ9&���s����t蘄T�DnǄ�rrD��'��w�A���{���I���� �ڏ�1�6 �Եp���j1��}�@6Kf��PK�C{��z�W�d3��-x=ⱳ���T0ӫbAi�F\��;�!i�)ŪZ�%�� ��2�!�b�"�+��P!	��`��-5$��"V��u���,g,�ޞ�ĭ
H�n�m*��<�)��|Vu�8r۩Fd莎�\Y����3[l�@h���\��i�Gl���,Z���x/�=A�S�P;�]��EB��H�|�ɜp��=��#)=�V=?��E,�,ҠRq��^K�%��o�81bc�nZQ�;�X���ߦ!Б@�y��N?J��"涎7�˺����������1T�-�4b�j:����E�%�-`>��C��c�T��RM(p�b�[SQ��JǼO�v"���OKԸS����kL���B�R�g3�6�l�t���Gz�8"��ޔ�m	h0{g�(�[U��:*yK�O���|�<N.��C���:�ӟ���p�4�j6�FD%���p��c�|~��m�?9~�ա����גVa-��|o\(��+�w!�j�ͱ����x�9�
�4����^ߠ��O�l(|]� $�Ɂ0>�N	j���n���Y�:5����)��3��qP�����jVS���tD�a�������p5��[ ʞ�ƚt�ȞQ
���,�S�k�����~�÷�Ð��0��s�	����[�A�T�e9]�+�B'y�4�6��:�]��vv(�jK0y�s�TU��c�@Ki�(�ׁr6c��S��3���ϋ���Hn)RH3��a6N���s�V[�!n	V#]�?C�L��l��w�8m�7#M�K6���1!W*y�^E�&?�5�*J��
����
~���a���ќρ��|W���2�w�$-�E$~n,�4M��"i�p�e��K/^rs�0+�Ns��Oj��=��s&��:9���{y�;0�+I&��-#��7�	%�djp틬�\��("�S`V��}��Έ�Xx�CB�L/�Gu��h��0�j����x0��TWб	�'Ã��G,ۑ����fuӷ#�`ͲQ����ܽms���\Ƹ�x��Z�9)T{2��m����������Df�7�쐝;�5ߟBN����xI'�;�m��tJ�x���	�J�$�Ng�c��� ���'��%©��jmEⶇ�iTZt�����6Q��N�O��L$�z��%���eD���f��1ku��*>��U]����#4SHV�E
!�w�jn��E�sm������v��ǒڵ<pz��C$�u�5w;����K�LB�Efݒ�ዃ�,i��B!�$FX��� H+τG�!Y���U�Z���>;��ɱ�(U�R�`�D�+��� Ԉ��rmWv��h�����"�η���� u�l?W���{�,
�t����D��u�'�w3����	?��ƈ��MӦ��z�9��i�����Q�Z_����s�46U��Y�]k
uK�8�F>�SB(���=�z�G�}�|>�O��R���t?�q������d�TE���N����yujgdm�R�=��h��"i�Wؿ�L�>�ǈ��e�TQ���+�L�{I�X��>֪�'�4g%҉z$�p�&�Ŗ�R�az|�(C��	� ��`Y��(�ҩ��I�z�>��Z;��l� ����"g��l*G���s�7)k(Q�g��_D���DKt��q��ܕtV��CG�(��q 
9DV�I>�JtkАTf̙a3N_�;�e]'7�3��SVâ�!o�)�����b� �0m/��%c���.���&|0?T1���9<���}?j��Ivmr&i�c�,k����,%�
k[���sDcp��*T�o���o�D�mFt����K�������	JĺQOZZޖs�k.��{: ��X?��mr��!�y�:'Yܯ2�vn(��W3��`r�(��J�߉B��myd^~��Q����`*�L]|���\���B�+�+"A��!ˋ���η�rvB�Bu�+�"ɒ�?�b��1���B��|Lf�y�}�]n�ީ5��]�x76t�;�ԯP���T��j�O"Yַ$�s|��){�L��D$»��9>����~W�!I��9�I�靤��n
V�Z��<�/L�Mc䤃�a/2�\���N1�ːCzތyX�t�l8��]�k�(rz����ɑ1KP��;o ��L��~���Y�̞�������e�Ie���!/�3��{�U�˔�]9f��O�#�f=;�%�b'�ֽ&�V�i�J�Awޑ.��J���p��HU[ә��f�E��D��̅��V�QO�6�B��1�SS&^Y�'�gZl*'�K�
�rL��j�6ݷJ����A;�U�	s>*V���D���u�3k{ˉ"��ɴtM�w`Q�����k��B�"me�l�Nk��Yز���.��@t�w�5;_ݒ����/��"���|�ڢT$��Q�N$nrl1#�Ozõ����L{��u#��yP��h�h[/g�ae��DG�Rؔ+����"ċ�����!��D���l^(Zp������&�j�����х'{�<ŖE�=��0�*CR�l��,l
��B�[�1%ec�)�.�^tΑgc�<x|��^Dz�*��&�,/6_�>�l[+��$�o�z��	u.ɡ,ѝ)Oq����l1����ŕ���"�Z`FQ�к��c͢�\<ko	 ��F�m*
�Y�3�
���d?��p�`Y��U{�ǨȲ��Њ����������8֤�K�Gy^����7�h���<��vL���9��TZz{��E�e�V+����^Iî���������I/�8��P�;��J�<���e��7R����������%ǥj6�f11�.�l:*[B��/�7A���q���i�vݑ�Z��~r@���+�$��:�'�ڜ�����/�`[�+�rh���Ƹ#r�OH2woi�]}�n�i�`��0韾.Ԉ��s�1L��A�#�W�����K���0�
��[��1,X8�����M�"���SKW�xR��ɀ�@h�:Ԃ?����2�H,Қe_�D ��3��@6�}K4�4�=�B;ʳ��p8�Tm �KC�F���Q��`bgu��'��Ϡ:۱v,���X?�ȻC&>���8���0;���z볻�1PTc�Û�
�?��Y��I��Z���U-���c6�fS���n�g!L�����!rz�`�:�T۸о��b��h��t��\i���}����dP�>Klh��0�U��A�t�H+El �}�118%z���*GGR%Y�b4����7Ţd�l>���׺��-5 �  VY+����J	�&2P�?�D�s?&{��]�b�p��0�_��ç%8n�nFT�/�P����b����Ԍ�۵�lr��U4��3�2��!s�y\Q��/e�=_���؎�~s�v0�H���g]�J��,ڐ�X���1
2�X������߲NuY,�I��v�����M�A�s�=Zy���f��X�����/��EʑZp�4h�А�>*�)!�y��c:�E3���|�Ĺ�<����j��-����"q�K.P�n'�E,��e)���v��_�HP�9�?��GuGg�W���ANڒ��哌��+���b��d�WNQ6<t��]eX�i4>�;��Z�Q�(4��Aߦ�P�%I��5��
K� Dy�v�pTa1�@0�Rp�}��p���1n��u)�{Î�w�,�6>�3Δ��l��K�`�G��ro�&*YA: J)i�{r�k~��H]r��v�+�ͻd;�o8��0ͼ��+@(�%��<����3�������,���w�J��� �����
��S`$T�܆:Κ�Mʜ�p�0��V��o�%�(PC��Y�u���Nx�ק	bj	f��󟞍04� aWd����d;�=���,k� �A�U͝&�����ʴa 1��2���֨Y�%M�O�!�U�v��y�I�Vq�$��3�7U)h9�do蔆���p�����Fm�k/�-������q1�}�(V�`���t��	\J�̜]�����p���>w0�E�9L��|�'x�;��h��~{Չ���Bǲ���ǂ���#�ӷ=�UԠ��X�#�_�;;��Ԗ}̴�����x�����ȵ������w��wh�/�B�0��"����Dn��mƲ��BW�W���}&�!��7W�^���9U�a7��]�5��G�����ĄSa�q��P���̱};5��z9�=���I�R���)��Z��E�Wb��i�v��aħx�(�H���a���ofJ�P��U�.?��8F{z��3k^�b�o�#�:k��z
EN�^�&�Gp
���z���o��v�Zg��x�E�z
\(���W����b �9�i.ۢ�ӫB���w?��W�o�����ͬs���F353�I��n����)�����!�U5������y9�{ϧ�}4
0	�\���_���.�H���%����
_��^�&�K�{�z*�vRD���!��[�ʾ�n0�I�q�xq�9��?����=>�
jN1>����^ ô���mH>�����/�5A8�ɸ�8���e+����m���e�N	��u.^�&	E��t�z��=�=fZ�%�[�blv��F�ɨ�e�����VY����lP`
z/�ݟ�a�k�sқ�k�ɓ�t�zK(�@FԥU��]T�H�=Y��IQ0��H��24m�^���T�dlf���1�b3�����iwf�2�el�H����V�Y�f#z�*_�{���M�	�ozdm�k�ֵ�����W��"�.�l;��^���B?��U-G���t~�������W;��(�������1�K"04���R�L�UM-��k��dq�:�I}�~X�^��u�kɣE|�nh����4����lى�������21+���R���U_�V?��C���GX(��^�e!�(Rx�B]O�	>��{E�$����bW��*�m3Y/�{�d0�QZE/H��ڭՂ�U�j��T�s��ӭ��	�U7ͅl�I�N*?8�������y��,����«�W���H���]G[u��)��t�\:���,jJ���{N�޾�m�|
֦�w=�b� ���)+F�i�S�"�(�|]ف��qdX�1���O	]���|�QN����t�)g����Kl���4d����
�9�늽"%�hU�UCbՕt�t[����]x��O�\ �5/G�R����y���X���M���QR��$��������9�B%y��`F�J�>5w����0�:��{���B4���"֗Ґ�|f5��Ql�_q3����hR�z��P��$	��o��B�����~�yM��9��������kQ�ռ�+:ǰ�+s�W�R4k�^�`��Z�ᦓ�kT����_G��d��?7k��9^�����;��-A�ǧ(�Lc���{	
r]�
��"��}-Z1�r�pu3�\�ZP)
�M� ��T�p]x,��8��$�&�k�: wt{UB��$���Uh��}ޭ�Ns��b�튌͋���>|^����an0�?�[�����-�AG���׬�+J�.��\ǧҋ=L�������c�rTf������oj�6'/f�ႜ,�����ؽ���T��PY�mj#Dr���^Ė�'�W����D�!#M��Qj^�)�^����k;k3�LkU�Į��U(������zo��0=Uh���>ѩH���Ss+n
8��%���̨��I|��ƾ=�hƐո�U���ֲW�~���>mT��y	���@-�͏p
v��0cu�W/Bщuv�:�ߓ�D־�2�����H�
J_/���Y�T��3�_�� �@3}O�!�v�tY4���KP�N��A���Fف�9m�-E�E0�}~��}��lv8g�~�O�x�'ߞ���t�	%�f%[S�f��в���mxj��7���F�>��ctz����þw�G/=�B��@���S��3�_\��/�~�Q�������V�T���KCo�*���	���^�z������Q.�Ŋ�glA�5�aؖ�	噥�Uَ=�'�LV'��|3��xc<�P���Y~��g�Je��P�~+�#���
���8難�y�ex6�&���ӂ���3WY��6�w�K�j�P��y��?o�Cl�$T�x������g�\5Y�T�1���We3���<E�i�T�}5/<?49�&zϯ�Jzx��<�Ͳ�����v��Z&@�p�>�����Z�N��!���S;�R�ȉZ���^�ɧ�0ܚ����&d[�3���Yb�~����wQ��g�9���'���}%��ޮX��x�e(��;��c��1`�ٰ`}��7��۪_y'/>�ܳ���Z$�x�Z�˜����������L����j�s���Y&�o+��E=-�D�����_ <��m��;D:|��^8%ό��&���?���VŊ         �  x�UT�n"9}.?���c2��6�}q�'X@;�n&�~��MV������uΩS�P��k���Z�<8C�p�T�� FQf����	R�	U�N�)����sN�a>#x
���:/<xA��L+��s���.b���)��=U�#��i:�>HG��Q��V֑�Ѯk�c�_GP�Qp�+��f�9|��-����i2��,c��$��`���5s�s�!k)�ʒ/���!�p�H��]��-�Z��6�o�fϘ�K{��	[��Q�͆*����A}�JQ��ϊ5\�z���P�2ű�yʽѤn��1d�=:�D��pܐ��:}P�2���G��|�O���x�wT:����m7^��[�^K�{i*��dQ�"]�p���ȑ��8����!v-(<n<�6�
%�!��Ρ;d�L#f��y����?^�v�LV�2Ns�,kX��1���x�̝�☤e� �{H#�̺YV�ǘ��5�Ð���X,�*��aY�
��}�VHm�=��,S7f�
Ǯ˰J)I�M�ڗ�cĴ�9�%iN�-��¡LD
WFi���<!�1y
���1�JR�r~P�v�����~hoy��gI�`��fY�e�;�S^�l�f(����/�?e+�Ϋ��-pD��ԏ��4�	��:ߏT����}��S�Ԣ�t`�ړ���1ej�Q�o1Dd5������u%X�$�gX��[�b/%�q	��	��{�u���+�Ǜ�u�}��-�\��1�I=�孶�u6MA�SX����an���˼Qd=�<�0�N)y&��d����Y�6pڕ]��m�����2�*��q�<��1�cv�vy�,�d��m�_0E�n�-�1�mۈ����E~'�æ�䮂]�|toc6��hħaJYAv[ص�8��|���5B�5��O�����b�W��^`wK��d��md�Q�_���o|      	   �	  x�E��n�E���<<
���ˑ����wܵ�v)`�]}X,��d�㏇b�y�Y�ǿ�XF/�����C(����_�bK=O�^�5�V�����z��x���q���Ӓ�d�t|����"�o�>�9J	��n���gƀ�`N��mb�=�����=�Y�q�ƘFH!��n��EǏWo9c�����J-q��/oP�(9���F�#���-�{?N�(�\g@��s��1������B;N;�ŘkN��i�(���j(3��-���m@�5k}�?S���m�X����'��J9��v�������sBr�����y�l����~��a�r�8g�b�?�6�����H��ū�TC*�!�D�M�t��#�0����-94��!B��G遠o^' ����˽��I�w�SqO��@����#�\�Ï��3������y�jbx]Y��"�v�71bx�61�P{)��S��#�&f<�H�2�}�~�g���CE��XИ�{�ab�S'G01bf�&f��XC51x@��db�[���O�m��&Y%O�b�}11�p�:q�y��1RN;���J��ȞA�����O[�#7��nz��nb����#{G&f<�F��O�ȗ4L�"�K���H�)lb����db�%N��g�f61�"��L�Ԯ|��j�H�nb0q�����C b01X<�ۃ���s,�S\��G���fbP�iebpX͕�����01����n�ޡ����^v��e��l3EL���I@u3ELL���L���s31�P[�&�{���0���y{rq����ɗ��1<( ��mkU�\İ�}Bo�H>��)����sJ��E̼z���L�y�� 7��,&�ߏ�j�&f��L�TM/�ob8!�b�޿R]�z��"5��=?���"���F���Ӗ�j������Ӓ�a}b@��Ȟ:Մ1�t�s3ELi�E|�����B��hb�"F]���g4�01xL=���1�:�41��1��>R����~�&�L�y���c�xP��\L$R޼�����m����~s��В��Q
M塉QJ��91)@L��v��yMa��1�&��c�"�E�֙��'1R gE����BEZ� �mz��If��QGX�� R���X�������~V��/b�>8C��	W$��"F��m��G
.b�KU�i��4����L��p#}�_�hC I���N@�Ʌ��Њ|�
*M3/d.�h;��\
E�M��y���,�3����r�� ���i�������2�GC!�2Z翘����R�t,dVL&˅�\�rO�c�eC}b!sA��c�\���'���/d�)��\R7@F��2�}�Q��כ��ǲ�aL��MF�ÏƄw{��!���1j^42d�J�B&�<v_d�sH(�F&��`��2�Oܣ[�D�8j�42�B�*gd"� �LTBi�13���Is3��Oe�]���f��m[@U�P��a�I}&�d$��Au�t�I]�D1�ؒ�L3��� �Ę�����=��Hf�g�43Q)
B�ɬ#����E=p}f�Rp���Ӡ�����k�33RH	��+��Ӷ���6�&�4X=o��H23f�Hv��|���͌<
������j P�l�<�>̌�����t�?w)�����)�֫�T5Ʌ�Ldv�����r�&�3�es��!�{0��U����uS�nf�<���NZ����I�-��Q�(���$ Q�64Im,̌��ر�L�!j�by�D�b}����L3���L�[���̐a�13�!O}$����9�-fx�"�`z�/PrI13��^hh؁�T�[�$A65h1��LSQY�$�!��'�K�aɷm�~pnf�R���f&�)�f&����vڀ
�9lf.�<�]
;�3�F߱G���`�|��4���u8���$1���$1��>���������b�n�0Nf͗�m�
ylfpAM{4��$�6�s��i�0��+�T�dfpIR�nf09@�G3��0:��?;���3��n�f���GS'�h��S���6.O�o;�g��<�eJ��2�������0f�dM�f&c-���G3�oI[3�>*�*�b�� .cf&�����dMJ����ۧď{jf&��r��n���b����L2%L?X�d1SH�if�a4���g�F_z]13Yemf2�$MKfF�>�L3����Nbf��u1��N�HwUA}n��_���"�%� ��z���j�jfF.r����t��/f:UH.��b��{6�03u�63Y̔��un}P���YLc)���#1����m�-Ø��EA�?�IN~n?��4nR��L���l�\�;���&�R�+�X�'B��Q2qk03<(�?3�������Jܷ���ye�߷9���G�� �j��;�������q����     