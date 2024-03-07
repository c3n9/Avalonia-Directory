PGDMP      0                |            ChitChat    16.1    16.1 "               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16589    ChitChat    DATABASE     ~   CREATE DATABASE "ChitChat" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "ChitChat";
                postgres    false            �            1259    16612    ChatMessage    TABLE     �   CREATE TABLE public."ChatMessage" (
    "Id" integer NOT NULL,
    "SenderId" integer NOT NULL,
    "ChatroomId" integer NOT NULL,
    "Date" timestamp with time zone NOT NULL,
    "Message" character varying(500) NOT NULL
);
 !   DROP TABLE public."ChatMessage";
       public         heap    postgres    false            �            1259    16611    ChatMessage_Id_seq    SEQUENCE     �   ALTER TABLE public."ChatMessage" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ChatMessage_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    16595    Chatroom    TABLE     j   CREATE TABLE public."Chatroom" (
    "Id" integer NOT NULL,
    "Topic" character varying(50) NOT NULL
);
    DROP TABLE public."Chatroom";
       public         heap    postgres    false            �            1259    16646    Chatroom_Id_seq    SEQUENCE     �   ALTER TABLE public."Chatroom" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Chatroom_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    16590 
   Department    TABLE     k   CREATE TABLE public."Department" (
    "Id" integer NOT NULL,
    "Name" character varying(50) NOT NULL
);
     DROP TABLE public."Department";
       public         heap    postgres    false            �            1259    16645    Department_Id_seq    SEQUENCE     �   ALTER TABLE public."Department" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Department_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    16601    Employee    TABLE     �   CREATE TABLE public."Employee" (
    "Id" integer NOT NULL,
    "Name" character varying(50) NOT NULL,
    "DepartmentId" integer NOT NULL,
    "Username" character varying(50) NOT NULL,
    "Password" character varying(50) NOT NULL
);
    DROP TABLE public."Employee";
       public         heap    postgres    false            �            1259    16630    EmployeeChatroom    TABLE     �   CREATE TABLE public."EmployeeChatroom" (
    "Id" integer NOT NULL,
    "EmployeeId" integer NOT NULL,
    "ChatroomId" integer NOT NULL
);
 &   DROP TABLE public."EmployeeChatroom";
       public         heap    postgres    false            �            1259    16629    EmployeeChatroom_Id_seq    SEQUENCE     �   ALTER TABLE public."EmployeeChatroom" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."EmployeeChatroom_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    16600    Employee_Id_seq    SEQUENCE     �   ALTER TABLE public."Employee" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Employee_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218                      0    16612    ChatMessage 
   TABLE DATA           Z   COPY public."ChatMessage" ("Id", "SenderId", "ChatroomId", "Date", "Message") FROM stdin;
    public          postgres    false    220   8'                 0    16595    Chatroom 
   TABLE DATA           3   COPY public."Chatroom" ("Id", "Topic") FROM stdin;
    public          postgres    false    216   �'                 0    16590 
   Department 
   TABLE DATA           4   COPY public."Department" ("Id", "Name") FROM stdin;
    public          postgres    false    215   (                 0    16601    Employee 
   TABLE DATA           Z   COPY public."Employee" ("Id", "Name", "DepartmentId", "Username", "Password") FROM stdin;
    public          postgres    false    218   R(       	          0    16630    EmployeeChatroom 
   TABLE DATA           N   COPY public."EmployeeChatroom" ("Id", "EmployeeId", "ChatroomId") FROM stdin;
    public          postgres    false    222   �(                  0    0    ChatMessage_Id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."ChatMessage_Id_seq"', 8, true);
          public          postgres    false    219                       0    0    Chatroom_Id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Chatroom_Id_seq"', 5, true);
          public          postgres    false    224                       0    0    Department_Id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Department_Id_seq"', 1, false);
          public          postgres    false    223                       0    0    EmployeeChatroom_Id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."EmployeeChatroom_Id_seq"', 11, true);
          public          postgres    false    221                       0    0    Employee_Id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Employee_Id_seq"', 6, true);
          public          postgres    false    217            k           2606    16618    ChatMessage ChatMessage_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."ChatMessage"
    ADD CONSTRAINT "ChatMessage_pkey" PRIMARY KEY ("Id");
 J   ALTER TABLE ONLY public."ChatMessage" DROP CONSTRAINT "ChatMessage_pkey";
       public            postgres    false    220            g           2606    16599    Chatroom Chatroom_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Chatroom"
    ADD CONSTRAINT "Chatroom_pkey" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."Chatroom" DROP CONSTRAINT "Chatroom_pkey";
       public            postgres    false    216            e           2606    16594    Department Department_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Department"
    ADD CONSTRAINT "Department_pkey" PRIMARY KEY ("Id");
 H   ALTER TABLE ONLY public."Department" DROP CONSTRAINT "Department_pkey";
       public            postgres    false    215            m           2606    16634 &   EmployeeChatroom EmployeeChatroom_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."EmployeeChatroom"
    ADD CONSTRAINT "EmployeeChatroom_pkey" PRIMARY KEY ("Id");
 T   ALTER TABLE ONLY public."EmployeeChatroom" DROP CONSTRAINT "EmployeeChatroom_pkey";
       public            postgres    false    222            i           2606    16605    Employee Employee_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."Employee" DROP CONSTRAINT "Employee_pkey";
       public            postgres    false    218            o           2606    16624    ChatMessage FK_CHATROOM    FK CONSTRAINT     �   ALTER TABLE ONLY public."ChatMessage"
    ADD CONSTRAINT "FK_CHATROOM" FOREIGN KEY ("ChatroomId") REFERENCES public."Chatroom"("Id");
 E   ALTER TABLE ONLY public."ChatMessage" DROP CONSTRAINT "FK_CHATROOM";
       public          postgres    false    220    4711    216            q           2606    16640    EmployeeChatroom FK_Chatrrom    FK CONSTRAINT     �   ALTER TABLE ONLY public."EmployeeChatroom"
    ADD CONSTRAINT "FK_Chatrrom" FOREIGN KEY ("ChatroomId") REFERENCES public."Chatroom"("Id");
 J   ALTER TABLE ONLY public."EmployeeChatroom" DROP CONSTRAINT "FK_Chatrrom";
       public          postgres    false    222    4711    216            n           2606    16606    Employee FK_DEPARTMENT    FK CONSTRAINT     �   ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "FK_DEPARTMENT" FOREIGN KEY ("DepartmentId") REFERENCES public."Department"("Id");
 D   ALTER TABLE ONLY public."Employee" DROP CONSTRAINT "FK_DEPARTMENT";
       public          postgres    false    218    4709    215            r           2606    16635    EmployeeChatroom FK_Employee    FK CONSTRAINT     �   ALTER TABLE ONLY public."EmployeeChatroom"
    ADD CONSTRAINT "FK_Employee" FOREIGN KEY ("EmployeeId") REFERENCES public."Employee"("Id");
 J   ALTER TABLE ONLY public."EmployeeChatroom" DROP CONSTRAINT "FK_Employee";
       public          postgres    false    218    222    4713            p           2606    16619    ChatMessage FK_SENDER    FK CONSTRAINT     �   ALTER TABLE ONLY public."ChatMessage"
    ADD CONSTRAINT "FK_SENDER" FOREIGN KEY ("SenderId") REFERENCES public."Employee"("Id");
 C   ALTER TABLE ONLY public."ChatMessage" DROP CONSTRAINT "FK_SENDER";
       public          postgres    false    4713    218    220               �   x�e��
�0E��+�,i�KZ��)8(:���@HJ��߷u��^8�e�!�Jc��Q�h�8D��ýv)���G�+�laC�S���s���X�X�{�Da�Y^>��x֘Gq)��%ܮg��5���Q9��h��7�D��B%1L��Cr�?��0�            x�3�4��2�I-.q�H,����� 4��         6   x�3�(�O/J�U(��)-���SH�/RH*��K-.���2���	����� x��         R   x�3�L6γ�4�P����Φ�&�~UnΉI�᮹嶶\f���ىE@u��ɴ2+����ȯ�)O۫�)����0F��� �2      	   #   x���4�4��4��@�)��!�g����� @��     