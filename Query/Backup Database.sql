PGDMP         #        
        {            projectsql2608    15.2    15.2 !    &           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            '           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            (           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            )           1262    16989    projectsql2608    DATABASE     �   CREATE DATABASE projectsql2608 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE projectsql2608;
                postgres    false            �            1259    16995    advertisement_ad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.advertisement_ad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.advertisement_ad_id_seq;
       public          postgres    false            �            1259    17010    advertisement    TABLE     �   CREATE TABLE public.advertisement (
    ad_id integer DEFAULT nextval('public.advertisement_ad_id_seq'::regclass) NOT NULL,
    car_id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(255) NOT NULL,
    date_post date
);
 !   DROP TABLE public.advertisement;
       public         heap    postgres    false    216            �            1259    16993    bid_bid_id_seq    SEQUENCE     w   CREATE SEQUENCE public.bid_bid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.bid_bid_id_seq;
       public          postgres    false            �            1259    16998    bid    TABLE       CREATE TABLE public.bid (
    bid_id integer DEFAULT nextval('public.bid_bid_id_seq'::regclass) NOT NULL,
    ad_id integer NOT NULL,
    bidder_id integer NOT NULL,
    date_bid date NOT NULL,
    bid_price integer NOT NULL,
    bid_status character varying(25) NOT NULL
);
    DROP TABLE public.bid;
       public         heap    postgres    false    214            �            1259    16994    car_car_id_seq    SEQUENCE     w   CREATE SEQUENCE public.car_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.car_car_id_seq;
       public          postgres    false            �            1259    17004    car    TABLE     '  CREATE TABLE public.car (
    car_id integer DEFAULT nextval('public.car_car_id_seq'::regclass) NOT NULL,
    brand character varying(100) NOT NULL,
    model character varying(255) NOT NULL,
    body_type character varying(25) NOT NULL,
    year integer NOT NULL,
    price integer NOT NULL
);
    DROP TABLE public.car;
       public         heap    postgres    false    215            �            1259    16997    location_location_id_seq    SEQUENCE     �   CREATE SEQUENCE public.location_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.location_location_id_seq;
       public          postgres    false            �            1259    17022    location    TABLE     �   CREATE TABLE public.location (
    location_id integer DEFAULT nextval('public.location_location_id_seq'::regclass) NOT NULL,
    city_name character varying(50) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL
);
    DROP TABLE public.location;
       public         heap    postgres    false    218            �            1259    16996    user_account_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_account_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.user_account_user_id_seq;
       public          postgres    false            �            1259    17016    user_account    TABLE     �   CREATE TABLE public.user_account (
    user_id integer DEFAULT nextval('public.user_account_user_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    contact character varying(15) NOT NULL,
    location_id integer NOT NULL
);
     DROP TABLE public.user_account;
       public         heap    postgres    false    217            !          0    17010    advertisement 
   TABLE DATA           Q   COPY public.advertisement (ad_id, car_id, user_id, title, date_post) FROM stdin;
    public          postgres    false    221   c&                 0    16998    bid 
   TABLE DATA           X   COPY public.bid (bid_id, ad_id, bidder_id, date_bid, bid_price, bid_status) FROM stdin;
    public          postgres    false    219   _+                  0    17004    car 
   TABLE DATA           K   COPY public.car (car_id, brand, model, body_type, year, price) FROM stdin;
    public          postgres    false    220   �3       #          0    17022    location 
   TABLE DATA           O   COPY public.location (location_id, city_name, latitude, longitude) FROM stdin;
    public          postgres    false    223   �5       "          0    17016    user_account 
   TABLE DATA           K   COPY public.user_account (user_id, name, contact, location_id) FROM stdin;
    public          postgres    false    222   /7       *           0    0    advertisement_ad_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.advertisement_ad_id_seq', 1, false);
          public          postgres    false    216            +           0    0    bid_bid_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.bid_bid_id_seq', 1, false);
          public          postgres    false    214            ,           0    0    car_car_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.car_car_id_seq', 1, false);
          public          postgres    false    215            -           0    0    location_location_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.location_location_id_seq', 1, false);
          public          postgres    false    218            .           0    0    user_account_user_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.user_account_user_id_seq', 1, false);
          public          postgres    false    217            �           2606    17015     advertisement advertisement_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.advertisement
    ADD CONSTRAINT advertisement_pkey PRIMARY KEY (ad_id);
 J   ALTER TABLE ONLY public.advertisement DROP CONSTRAINT advertisement_pkey;
       public            postgres    false    221                       2606    17003    bid bid_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.bid
    ADD CONSTRAINT bid_pkey PRIMARY KEY (bid_id);
 6   ALTER TABLE ONLY public.bid DROP CONSTRAINT bid_pkey;
       public            postgres    false    219            �           2606    17009 
   car car_id 
   CONSTRAINT     L   ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_id PRIMARY KEY (car_id);
 4   ALTER TABLE ONLY public.car DROP CONSTRAINT car_id;
       public            postgres    false    220            �           2606    17027    location location_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);
 @   ALTER TABLE ONLY public.location DROP CONSTRAINT location_pkey;
       public            postgres    false    223            �           2606    17021    user_account user_account_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (user_id);
 H   ALTER TABLE ONLY public.user_account DROP CONSTRAINT user_account_pkey;
       public            postgres    false    222            �           2606    17028 	   bid ad_id    FK CONSTRAINT     {   ALTER TABLE ONLY public.bid
    ADD CONSTRAINT ad_id FOREIGN KEY (ad_id) REFERENCES public.advertisement(ad_id) NOT VALID;
 3   ALTER TABLE ONLY public.bid DROP CONSTRAINT ad_id;
       public          postgres    false    221    3203    219            �           2606    17033 (   advertisement advertisement_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.advertisement
    ADD CONSTRAINT advertisement_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_account(user_id);
 R   ALTER TABLE ONLY public.advertisement DROP CONSTRAINT advertisement_user_id_fkey;
       public          postgres    false    222    3205    221            �           2606    17038    advertisement car_id    FK CONSTRAINT     ~   ALTER TABLE ONLY public.advertisement
    ADD CONSTRAINT car_id FOREIGN KEY (car_id) REFERENCES public.car(car_id) NOT VALID;
 >   ALTER TABLE ONLY public.advertisement DROP CONSTRAINT car_id;
       public          postgres    false    221    220    3201            �           2606    17043    user_account location_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT location_id FOREIGN KEY (location_id) REFERENCES public.location(location_id) NOT VALID;
 B   ALTER TABLE ONLY public.user_account DROP CONSTRAINT location_id;
       public          postgres    false    3207    223    222            !   �  x��X�n#7<�_���l��o�E� A��$@.��a+kH�-��>�I�g� �E�6�����y�����w�?/>�˧~�]���Z������ů�}[l���jAJ'A�L�<~��	¨}���_���}o�8
�@ۑ�F��>���m����v'~�7wO���%��u��c��I�_^�������^j9<�S�u�I"؊�>^�����l�۝;�$
&���w��|�|w�8�(��)�=#-�_hH�r�V��aR�Oo���o~��H���wMW��
� p�"P�L�W�L����R'��>V�L<�H��֋�o������/������^�w��r�v0��@����U�4*��D1�s7���e�$d��>d��ם�a�duu�C��9v���˻
ܡz�Anp�C"�(�j)�?�o �i��K�Tf��=�Ղ���<��Ю����-~� =i�|7��>�?���jB�@>����;���܁t�$�^�Wi�/�'�Q��[TKd�JЁ.�Y��>���)Q9�w��F���|͎�)[5=���c�� �Wn
��ඎ�ն0�ш��Y�m�:�㑸�lG��kC8��$�	$��88q��h7�� 05�����ۍC�P>���\5L�Eɳ�Vb�H
H�v�<�rJ<��ek#�TJ��85I�x6S�(�'�����I!wNi�n4�z�i,)WIqw.��y�����n�r����N�(L�wUr�D�y}�G��@�t�t�/��,��������x�L�Y��Ƹ�����I=~,�͈/��y��8��o �8������3斚���g%\���RI,�h�\/
���@�V��,���f�Q.��웱������K�Hગ�����תw[ ����\���'�*�mN@Gӑb^uv�0��A����Uq)�%6W8�0�Q�\ó��yv2k����֬2
���7x��ˁ�?��v6�늝�nt+pں-�#�t��)�1S.�)�־y8�I��0�T_D�G�cN�g�Qq�o�}�~| ��Y	`�Ydc��{+����ˣf�!ļ��9O=��%�I��jœ�U-�s���1�S1�U��oZ&��i[g��X�G���3�12eK{B.3{��S2y�}�Y���-�#뵞*�:��3n؜�Y6�2��r7l���L�<52�~±~a��fe� �RbA	�	��%<���d�kz��')��0x�w         @  x��Xˎ 7;��K/��-�^s�5��?�tYv�i��V[�DRt���G��O?�˰>���߿�����!s��O��CC�4}C�	d���FDdo����#b'��3E�g��Jb<C�"���(���;�#��9{��]����JA�����7"�'�ĕ�8td�3&�<���Ud�&;�U�ڊ��ѱ!�#��;:�C-x��J��1Sf�}�m��'�5�.f�kA�:{[]a"���n������u�H1�z�IT�q���GW�*i��6��ч��e	�oH��F�M�<�D���	Aj�3dT1�A�^����cd����c[p�%�-z�ܵ`����u
�) SFou����/@*&����;��Ƭ6�v�����\�RO��V��M�g�F����?�1(�?�֋��%Q3wcx����D�:4*S..����,ѻo"������X�ٻ��k�	�7�.��pm�T Q7r��`p�c��n~���kc�:�ʹ�ֻ��e��l��'d�ւ�J�칛g"+~�a�@6<��Yڼ�ksb�;d<=6��[���5q��Rr�y�q����t+r$oUgid�4݉@{d9��+d ���^_]1�x�\�j�zs������qH� �d'n���9:�����'�j� ޴V����>v`j �s3�͂�B$��C�R�~I-�q�fC}�_s���&YܰY�*�Ʉ����K �h��eQ� ��rO�G̸wB[�kD5u�
]��T�%E��M&��v�:0����<ow;�xC�Z�r���#!�q��	'��(���nbs�}�a���"%��a�$X�ӯ8cKc�a%�A�~B�p!��9����\��z�h�.�|����W��`���u�#�C)�C! ;M�g���LKL���>r���H��:ɺ#pAd�Mgj�Q�l�p�3g��V�%A���������$�-�E�����wr�����BQG��D쫌��P\Oᵏ�((�W�۴�����PJ���v��^�l)�wG,���mPp�	��t8:��X���G��3��1j�����냰b}�1�6�ܝ�E��NR��9'�6:�k+|�T؅ i����،����>���BNs�BY.hu���7(��8���&�1���0�N��F;�S��`3�����`������U������b�ÿ�=k,H�u�o" Z]K��b��'�n��*ջ\��x��R0���!�d�+d0@�ڶ�D�D�m�y`�#z�B!Q�peh��z79%zb�����	(�0Ң9���f���0�~j	�km�u�9�v��t��[�L���Û��->zH0@v�y��$�$��1J�xN����m��} �ZN:����L�5C{G�ȯ5�i]M�+��M���&$�7�Ȋ1n������(�[痌��m>/�(�|$�iG��1O.�����jY<<ƙ&l�s��;pV�i�$�y�##� Fj��kg^�<���,g B�_�\��7��6��2L�J}��"\��xל���t!.5QH0d�_��i�snzb��ܡ�Tn���BЍ�|�Q
�ޟ�f'e�
(����bT�l��~�̽�^B���׮�Ƶ�����y�?� �͚���.�P���Q���_yw�^���X�M�O��z��@7����A3Zv��>��&�"'����2� 1�\/�?��D��u��)|�)�zV��mU1K4�c��Z˓+W��e ָ���CK5杘���c4�\\��ul���N=�,~�Q��2h2FV�B���ke����t���uԮ���p���F"7�r���3��-S@��>Os�Y<��K*�s7.���,�.G�l���͖��4`|��Y�h���5�����N=��8;?�1,%K�g�!�y?��yްD��(ǣ〣1q�Α#��~�i�.��1/��o�w���ia/(�;
V�<��^�������@�ft2?*Ϗ=9����㾬��1��a����� 1TG?ߪ��|f���)�x�^Og�v��h�����r�#�q_�����hgbkg`/�O����?����k�             x����j�@��GO�Hٝ��N 
%N�r�q�#,�O�~�N흍��Z�B��7�9sfW�}���5�����v���o�BZ�Έ��2�%㪌k���8
�D�ʔ�#H�	��z��m:��L�"�!��"LC��;�h$�Ɯ�XIQl�y�e��w��e�J��8{X�(�Yvؖ�n���!xβ�b�5X���k�nv���z��e�^q�UAF�V��)1,W�Q�	�9�K�
ʞ��źn60��x:z2�ڡNb�iH>���"N�-O���`�/�?�U��O��Ӿ���Q�v��m�&�*��m���K�՗j���L`Z�]�z����{<�ܤ�'�� @�u�rg�;�lh���V� +
�3l[�����3m���p1Jg�_���{;�	�Y@���b@�
>m�ng4�?�yw�*�]c=[���M&�@���H�g?ZH�-���@�;�0�vouzMn��z��B�,���,r�Q��mF� �g�ʈ� ˟��oUU�BTj�      #   `  x�U��j�@��)�:���f���%PH{X؋��`����y�Jv�/!�˯4&(н~O��u�Ϸ��S�"��*$��rj
>�IG]0B&^p)0;�g�1�&�Di���t�y�Iǔ�d�q�������_��%g��ƕ[ ����I�C�Rb�P[� 0

'rUW��G��Wu�����
ej5P������NwYZA��I�}������� ��ͥ%Y� t�|��R0�更(��,Nn���~���p����V,^�yT��?���{[���fm7Xj%r{�Н~��{�XN�L�����(��C_.j�f���1�b��>�/���ᬋ�QX�GsD��Z�C?�@��      "   .  x�]W�n#9=S_��iܗ��z���R�.̅n�$�R�ȥ�������Bo�H�����ئ�"nӎ��J/�Q�m4��ɉdO�6�66_S������4����n���r�J���n��i����ܥn�������W�s+E��)��D���is=���g�8=�����J'�!0%����m���x�}�R>f��h�kY�����mn�f��PNin�rAQ�9�e����56��%�h.��JZkM�	��<{h_"�:=�A8z+ת����?�t�!W� ,Z���j"8[���1m�R�<��j`�9~S93�]�-{�*�H-���IYKI�}�����s9���J��9���! 7�v��|�g��)����2n�E\��p�Fs.�rz"�����;��Ǹ}�]SiBXϽ��eV�DX�WzC�mط�bR[�=	g\�6��7�5nv�x#�IϮbf� ^�3�IA}+H��h^�PXץe㝒�x0��I�zmlוނ�Gi� �D
����]�M��:�c#`f1v�D>�{4�i�#��l�$V:��<��� _cW�:�\�L���G���]��Pw�U�p����qS�5���R��E�]�����q�pk��̱t���� ���xy$Dj��Y^���1n�þ)�S�&@S��1@���ms9�gUF[�l�(��m�=S�`{�X��+�q�Y[�J	ܦM3k��,aKa��v�Jf}-�.\~_��OF�ЂPFhH4�n��;<��q��u2�?Ub�&�i��˰;��s�}��(�*wQ��n�Ar� '�)^�V6W}����,Vxpe[r�P���C?q��3���o��A���[�Qyv�~�mG�85���嵈� |�1�T`�iy8�s	(!�
�>5'����3�
�Į	?��C���Ñud���2D4H�͟�5�)�F��#�N!�D��,M:��-i�N+�|���'��LC}�<H�Nx�Gmؗ���^#�.�!�������;"4+I[�t�͐�3��E�*$������rN极�C��Ų����zU��o��RPn�f\��,R�[�4Bm�|�8�%(xg
1���s7P梋�w.�R�xp�re��v�n=�Ÿ4��.W�SN���c5@�~+������p����6N�9�likLb��O��H�J�P�za�b�+�y��T,Q�l@
9�Vi����&u�X'jn���Q�K����+L/���-�K���^��7�x� Zx'r�C�Nj��zф,��͟`nW����JI �O�̂��m�g�ځ�AM+��2����/�ՈC侠�Yw��q{�+�"Xp�m��b� 0�iM��lUD�i��"x�)V�ٰ��͸����PP��9��!3.p�
�h��%m��N���X�c
���l����U����<�b��L��c�]�H�i�³¢�q�� ��a��1h� �jM
x�D�T����Q�t���ʚ dP�.�a�-�Ks���'u����5��v.MM&�=9f1���U|�S�5�]iڹ�G\J�]�����������P�Q@���)z�H��p^��`i.�F�.R��'h���VԆ{��b�ml�M��h� ���%[�e�f��8>�$D-�.}`�����pp��[_*�J���yv���|�a�@9�\�~��}�XeD���4�9�9�<z޿W��0�� x��'��{��q�9���j���IKS�|c�7�KZ�kEP�ri��3,Ԉ�:�v2���5{��y�'!`�,��|a��6������5y�A{'�{o�-��c��j�m�X����w0(C%��l�~����L	�U �2��O�c\��(�AʌD�ާ��p���0@2c�����f�0��j�O�����tH�Y��40]	J��Za�ۜɎ��� �"͠��Q���X#����c���Z�z0?�o4�^kԛ b�*��]�=�#��̢q���%��K��l��M�uuD	���Y�����y=��l1�I�鳴($����i
J�O ,�Be��d�H������ ����k�<K:__C�4O)����t2��2��     