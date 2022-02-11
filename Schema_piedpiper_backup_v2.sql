--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 14.1

-- Started on 2022-02-10 14:59:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 208 (class 1259 OID 16700)
-- Name: CardPayment; Type: TABLE; Schema: public; Owner: pp
--

CREATE TABLE public."CardPayment" (
    "ID" integer NOT NULL,
    card_nr integer NOT NULL,
    cvv integer NOT NULL,
    card_owner_name character varying(200) NOT NULL,
    card_expire date NOT NULL,
    card_type character varying(100),
    "User_id" integer NOT NULL
);


ALTER TABLE public."CardPayment" OWNER TO pp;

--
-- TOC entry 207 (class 1259 OID 16698)
-- Name: CardPayment_ID_seq; Type: SEQUENCE; Schema: public; Owner: pp
--

CREATE SEQUENCE public."CardPayment_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CardPayment_ID_seq" OWNER TO pp;

--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 207
-- Name: CardPayment_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pp
--

ALTER SEQUENCE public."CardPayment_ID_seq" OWNED BY public."CardPayment"."ID";


--
-- TOC entry 206 (class 1259 OID 16684)
-- Name: Group; Type: TABLE; Schema: public; Owner: pp
--

CREATE TABLE public."Group" (
    "ID" integer NOT NULL,
    name character varying(100) NOT NULL,
    "User_id" integer,
    description text,
    image "char"
);


ALTER TABLE public."Group" OWNER TO pp;

--
-- TOC entry 222 (class 1259 OID 16869)
-- Name: GroupPost; Type: TABLE; Schema: public; Owner: pp
--

CREATE TABLE public."GroupPost" (
    "ID" integer NOT NULL,
    "User_id" integer,
    "Group_id" integer,
    post text,
    time_date timestamp without time zone DEFAULT now()
);


ALTER TABLE public."GroupPost" OWNER TO pp;

--
-- TOC entry 221 (class 1259 OID 16867)
-- Name: GroupPost_ID_seq; Type: SEQUENCE; Schema: public; Owner: pp
--

CREATE SEQUENCE public."GroupPost_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GroupPost_ID_seq" OWNER TO pp;

--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 221
-- Name: GroupPost_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pp
--

ALTER SEQUENCE public."GroupPost_ID_seq" OWNED BY public."GroupPost"."ID";


--
-- TOC entry 205 (class 1259 OID 16682)
-- Name: Group_ID_seq; Type: SEQUENCE; Schema: public; Owner: pp
--

CREATE SEQUENCE public."Group_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Group_ID_seq" OWNER TO pp;

--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 205
-- Name: Group_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pp
--

ALTER SEQUENCE public."Group_ID_seq" OWNED BY public."Group"."ID";


--
-- TOC entry 220 (class 1259 OID 16851)
-- Name: Message; Type: TABLE; Schema: public; Owner: pp
--

CREATE TABLE public."Message" (
    "ID" integer NOT NULL,
    "from_User_id" integer,
    "to_User_id" integer,
    message text,
    time_date timestamp without time zone DEFAULT now()
);


ALTER TABLE public."Message" OWNER TO pp;

--
-- TOC entry 219 (class 1259 OID 16849)
-- Name: Message_ID_seq; Type: SEQUENCE; Schema: public; Owner: pp
--

CREATE SEQUENCE public."Message_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Message_ID_seq" OWNER TO pp;

--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 219
-- Name: Message_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pp
--

ALTER SEQUENCE public."Message_ID_seq" OWNED BY public."Message"."ID";


--
-- TOC entry 210 (class 1259 OID 16721)
-- Name: Order; Type: TABLE; Schema: public; Owner: pp
--

CREATE TABLE public."Order" (
    "ID" integer NOT NULL,
    status text,
    "CardPayment_id" integer,
    total_cost money,
    "User_id" integer
);


ALTER TABLE public."Order" OWNER TO pp;

--
-- TOC entry 218 (class 1259 OID 16832)
-- Name: OrderProduct; Type: TABLE; Schema: public; Owner: pp
--

CREATE TABLE public."OrderProduct" (
    "ID" integer NOT NULL,
    "Order_id" integer,
    "Product_id" integer,
    amount integer
);


ALTER TABLE public."OrderProduct" OWNER TO pp;

--
-- TOC entry 217 (class 1259 OID 16830)
-- Name: OrderProduct_ID_seq; Type: SEQUENCE; Schema: public; Owner: pp
--

CREATE SEQUENCE public."OrderProduct_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."OrderProduct_ID_seq" OWNER TO pp;

--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 217
-- Name: OrderProduct_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pp
--

ALTER SEQUENCE public."OrderProduct_ID_seq" OWNED BY public."OrderProduct"."ID";


--
-- TOC entry 209 (class 1259 OID 16719)
-- Name: Order_ID_seq; Type: SEQUENCE; Schema: public; Owner: pp
--

CREATE SEQUENCE public."Order_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Order_ID_seq" OWNER TO pp;

--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 209
-- Name: Order_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pp
--

ALTER SEQUENCE public."Order_ID_seq" OWNED BY public."Order"."ID";


--
-- TOC entry 226 (class 1259 OID 16907)
-- Name: Product; Type: TABLE; Schema: public; Owner: pp
--

CREATE TABLE public."Product" (
    "ID" integer NOT NULL,
    name character varying(150),
    description text,
    size character varying(50),
    price money,
    image text,
    storage integer
);


ALTER TABLE public."Product" OWNER TO pp;

--
-- TOC entry 212 (class 1259 OID 16757)
-- Name: ProductReview; Type: TABLE; Schema: public; Owner: pp
--

CREATE TABLE public."ProductReview" (
    "ID " integer NOT NULL,
    "Product_id" integer NOT NULL,
    "User_id" integer NOT NULL,
    comment text,
    rating integer NOT NULL
);


ALTER TABLE public."ProductReview" OWNER TO pp;

--
-- TOC entry 211 (class 1259 OID 16755)
-- Name: ProductReview_ID _seq; Type: SEQUENCE; Schema: public; Owner: pp
--

CREATE SEQUENCE public."ProductReview_ID _seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ProductReview_ID _seq" OWNER TO pp;

--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 211
-- Name: ProductReview_ID _seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pp
--

ALTER SEQUENCE public."ProductReview_ID _seq" OWNED BY public."ProductReview"."ID ";


--
-- TOC entry 214 (class 1259 OID 16796)
-- Name: Recommendations; Type: TABLE; Schema: public; Owner: pp
--

CREATE TABLE public."Recommendations" (
    "ID" integer NOT NULL,
    "User_id" integer NOT NULL,
    "Product_id" integer NOT NULL
);


ALTER TABLE public."Recommendations" OWNER TO pp;

--
-- TOC entry 213 (class 1259 OID 16794)
-- Name: Recommendations_ID_seq; Type: SEQUENCE; Schema: public; Owner: pp
--

CREATE SEQUENCE public."Recommendations_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Recommendations_ID_seq" OWNER TO pp;

--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 213
-- Name: Recommendations_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pp
--

ALTER SEQUENCE public."Recommendations_ID_seq" OWNED BY public."Recommendations"."ID";


--
-- TOC entry 224 (class 1259 OID 16889)
-- Name: ShoppingCart; Type: TABLE; Schema: public; Owner: pp
--

CREATE TABLE public."ShoppingCart" (
    "ID" integer NOT NULL,
    "User_id" integer NOT NULL,
    "Product_id" integer NOT NULL,
    amount integer
);


ALTER TABLE public."ShoppingCart" OWNER TO pp;

--
-- TOC entry 223 (class 1259 OID 16887)
-- Name: ShoppingCart_ID_seq; Type: SEQUENCE; Schema: public; Owner: pp
--

CREATE SEQUENCE public."ShoppingCart_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ShoppingCart_ID_seq" OWNER TO pp;

--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 223
-- Name: ShoppingCart_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pp
--

ALTER SEQUENCE public."ShoppingCart_ID_seq" OWNED BY public."ShoppingCart"."ID";


--
-- TOC entry 204 (class 1259 OID 16657)
-- Name: Ticket; Type: TABLE; Schema: public; Owner: pp
--

CREATE TABLE public."Ticket" (
    "ID " integer NOT NULL,
    "User_id" integer NOT NULL,
    "case" text NOT NULL,
    status character varying(30)
);


ALTER TABLE public."Ticket" OWNER TO pp;

--
-- TOC entry 203 (class 1259 OID 16655)
-- Name: Ticket_ID _seq; Type: SEQUENCE; Schema: public; Owner: pp
--

CREATE SEQUENCE public."Ticket_ID _seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ticket_ID _seq" OWNER TO pp;

--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 203
-- Name: Ticket_ID _seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pp
--

ALTER SEQUENCE public."Ticket_ID _seq" OWNED BY public."Ticket"."ID ";


--
-- TOC entry 230 (class 1259 OID 16953)
-- Name: User; Type: TABLE; Schema: public; Owner: pp
--

CREATE TABLE public."User" (
    "ID" integer NOT NULL,
    user_name character varying(30) NOT NULL,
    password character varying(50) NOT NULL,
    email character varying(320) NOT NULL
);


ALTER TABLE public."User" OWNER TO pp;

--
-- TOC entry 216 (class 1259 OID 16814)
-- Name: UserGroup; Type: TABLE; Schema: public; Owner: pp
--

CREATE TABLE public."UserGroup" (
    "ID" integer NOT NULL,
    "User_id" integer NOT NULL,
    "Group_id" integer NOT NULL,
    role character varying(30) NOT NULL
);


ALTER TABLE public."UserGroup" OWNER TO pp;

--
-- TOC entry 215 (class 1259 OID 16812)
-- Name: UserGroup_ID_seq; Type: SEQUENCE; Schema: public; Owner: pp
--

CREATE SEQUENCE public."UserGroup_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."UserGroup_ID_seq" OWNER TO pp;

--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 215
-- Name: UserGroup_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pp
--

ALTER SEQUENCE public."UserGroup_ID_seq" OWNED BY public."UserGroup"."ID";


--
-- TOC entry 228 (class 1259 OID 16915)
-- Name: UserPost; Type: TABLE; Schema: public; Owner: pp
--

CREATE TABLE public."UserPost" (
    "ID" integer NOT NULL,
    "User_id" integer,
    post text NOT NULL,
    time_date timestamp without time zone DEFAULT now() NOT NULL,
    "UserPost_reply_id" integer
);


ALTER TABLE public."UserPost" OWNER TO pp;

--
-- TOC entry 227 (class 1259 OID 16913)
-- Name: UserPost_ID_seq; Type: SEQUENCE; Schema: public; Owner: pp
--

CREATE SEQUENCE public."UserPost_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."UserPost_ID_seq" OWNER TO pp;

--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 227
-- Name: UserPost_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pp
--

ALTER SEQUENCE public."UserPost_ID_seq" OWNED BY public."UserPost"."ID";


--
-- TOC entry 229 (class 1259 OID 16951)
-- Name: User_ID_seq; Type: SEQUENCE; Schema: public; Owner: pp
--

CREATE SEQUENCE public."User_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_ID_seq" OWNER TO pp;

--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 229
-- Name: User_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pp
--

ALTER SEQUENCE public."User_ID_seq" OWNED BY public."User"."ID";


--
-- TOC entry 225 (class 1259 OID 16905)
-- Name: product_ID_seq; Type: SEQUENCE; Schema: public; Owner: pp
--

CREATE SEQUENCE public."product_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."product_ID_seq" OWNER TO pp;

--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 225
-- Name: product_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pp
--

ALTER SEQUENCE public."product_ID_seq" OWNED BY public."Product"."ID";


--
-- TOC entry 2883 (class 2604 OID 16703)
-- Name: CardPayment ID; Type: DEFAULT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."CardPayment" ALTER COLUMN "ID" SET DEFAULT nextval('public."CardPayment_ID_seq"'::regclass);


--
-- TOC entry 2882 (class 2604 OID 16687)
-- Name: Group ID; Type: DEFAULT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Group" ALTER COLUMN "ID" SET DEFAULT nextval('public."Group_ID_seq"'::regclass);


--
-- TOC entry 2891 (class 2604 OID 16872)
-- Name: GroupPost ID; Type: DEFAULT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."GroupPost" ALTER COLUMN "ID" SET DEFAULT nextval('public."GroupPost_ID_seq"'::regclass);


--
-- TOC entry 2889 (class 2604 OID 16854)
-- Name: Message ID; Type: DEFAULT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Message" ALTER COLUMN "ID" SET DEFAULT nextval('public."Message_ID_seq"'::regclass);


--
-- TOC entry 2884 (class 2604 OID 16724)
-- Name: Order ID; Type: DEFAULT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Order" ALTER COLUMN "ID" SET DEFAULT nextval('public."Order_ID_seq"'::regclass);


--
-- TOC entry 2888 (class 2604 OID 16835)
-- Name: OrderProduct ID; Type: DEFAULT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."OrderProduct" ALTER COLUMN "ID" SET DEFAULT nextval('public."OrderProduct_ID_seq"'::regclass);


--
-- TOC entry 2894 (class 2604 OID 16910)
-- Name: Product ID; Type: DEFAULT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Product" ALTER COLUMN "ID" SET DEFAULT nextval('public."product_ID_seq"'::regclass);


--
-- TOC entry 2885 (class 2604 OID 16760)
-- Name: ProductReview ID ; Type: DEFAULT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."ProductReview" ALTER COLUMN "ID " SET DEFAULT nextval('public."ProductReview_ID _seq"'::regclass);


--
-- TOC entry 2886 (class 2604 OID 16799)
-- Name: Recommendations ID; Type: DEFAULT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Recommendations" ALTER COLUMN "ID" SET DEFAULT nextval('public."Recommendations_ID_seq"'::regclass);


--
-- TOC entry 2893 (class 2604 OID 16892)
-- Name: ShoppingCart ID; Type: DEFAULT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."ShoppingCart" ALTER COLUMN "ID" SET DEFAULT nextval('public."ShoppingCart_ID_seq"'::regclass);


--
-- TOC entry 2881 (class 2604 OID 16660)
-- Name: Ticket ID ; Type: DEFAULT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Ticket" ALTER COLUMN "ID " SET DEFAULT nextval('public."Ticket_ID _seq"'::regclass);


--
-- TOC entry 2897 (class 2604 OID 16956)
-- Name: User ID; Type: DEFAULT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."User" ALTER COLUMN "ID" SET DEFAULT nextval('public."User_ID_seq"'::regclass);


--
-- TOC entry 2887 (class 2604 OID 16817)
-- Name: UserGroup ID; Type: DEFAULT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."UserGroup" ALTER COLUMN "ID" SET DEFAULT nextval('public."UserGroup_ID_seq"'::regclass);


--
-- TOC entry 2895 (class 2604 OID 16918)
-- Name: UserPost ID; Type: DEFAULT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."UserPost" ALTER COLUMN "ID" SET DEFAULT nextval('public."UserPost_ID_seq"'::regclass);


--
-- TOC entry 3078 (class 0 OID 16700)
-- Dependencies: 208
-- Data for Name: CardPayment; Type: TABLE DATA; Schema: public; Owner: pp
--

INSERT INTO public."CardPayment" VALUES (1, 123123123, 123, 'secret hidden', '2022-08-01', 'VISA', 3);
INSERT INTO public."CardPayment" VALUES (2, 123123123, 123, 'something common', '2024-11-01', 'Mastercard', 5);


--
-- TOC entry 3076 (class 0 OID 16684)
-- Dependencies: 206
-- Data for Name: Group; Type: TABLE DATA; Schema: public; Owner: pp
--

INSERT INTO public."Group" VALUES (3, 'hello world', 3, 'hello world grupp is the best', NULL);
INSERT INTO public."Group" VALUES (4, 'Super Best Friend', 5, 'YEY here we can be best friend with all.', NULL);
INSERT INTO public."Group" VALUES (5, 'Let go and kick ass', 6, 'we kick ass', NULL);


--
-- TOC entry 3092 (class 0 OID 16869)
-- Dependencies: 222
-- Data for Name: GroupPost; Type: TABLE DATA; Schema: public; Owner: pp
--

INSERT INTO public."GroupPost" VALUES (1, 3, 3, 'hello world this is me.', '2022-02-10 13:48:04.563498');
INSERT INTO public."GroupPost" VALUES (2, 5, 3, 'Hello i am admin, if anyone need help, ask me.', '2022-02-10 13:48:04.563498');
INSERT INTO public."GroupPost" VALUES (3, 6, 4, 'hi i want to be best friend with you all', '2022-02-10 13:48:04.563498');
INSERT INTO public."GroupPost" VALUES (4, 6, 5, 'Let''s kick ass and eat all bubbelgum', '2022-02-10 13:48:04.563498');


--
-- TOC entry 3090 (class 0 OID 16851)
-- Dependencies: 220
-- Data for Name: Message; Type: TABLE DATA; Schema: public; Owner: pp
--

INSERT INTO public."Message" VALUES (2, 3, 5, 'you suck', '2022-02-10 14:29:32.756776');
INSERT INTO public."Message" VALUES (3, 5, 3, 'no, you suck', '2022-02-10 14:29:46.637285');
INSERT INTO public."Message" VALUES (4, 6, 7, 'Are we still on for monday kl 19?', '2022-02-10 14:30:26.834987');
INSERT INTO public."Message" VALUES (5, 7, 6, 'yes', '2022-02-10 14:30:39.374324');


--
-- TOC entry 3080 (class 0 OID 16721)
-- Dependencies: 210
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: pp
--

INSERT INTO public."Order" VALUES (2, 'prepering to send', 2, '$129.00', 5);
INSERT INTO public."Order" VALUES (1, 'completed', 1, '$6,217.00', 3);
INSERT INTO public."Order" VALUES (3, 'Sent', 2, '$1,949.75', 5);


--
-- TOC entry 3088 (class 0 OID 16832)
-- Dependencies: 218
-- Data for Name: OrderProduct; Type: TABLE DATA; Schema: public; Owner: pp
--

INSERT INTO public."OrderProduct" VALUES (1, 1, 1, 1);
INSERT INTO public."OrderProduct" VALUES (2, 1, 3, 2);
INSERT INTO public."OrderProduct" VALUES (3, 2, 4, 1);
INSERT INTO public."OrderProduct" VALUES (4, 3, 2, 5);


--
-- TOC entry 3096 (class 0 OID 16907)
-- Dependencies: 226
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: pp
--

INSERT INTO public."Product" VALUES (1, 'cool green ball', 'cool ball for cats and dogs', NULL, '$5,599.00', 'green_ball.pgn', 42);
INSERT INTO public."Product" VALUES (4, 'Odd dog toy', 'Fun toy for all dogs. Warrning, my be to big for smaller dog and will struggel to use it.', 'Large', '$129.00', 'odd_dog_toy.jpeg', 11);
INSERT INTO public."Product" VALUES (2, 'Random food', 'Heres random food safe for cats, bunny and rats to eat. They will allways eat it and is safe, and if you lucky they will love it.', NULL, '$389.95', 'suprice_food.png', 888);
INSERT INTO public."Product" VALUES (3, 'Odd dog toy', 'Fun toy for all dogs. Warrning do not give to big dog as its my chock on it.', 'small', '$109.00', 'odd_dog_toy.jpeg', 22);


--
-- TOC entry 3082 (class 0 OID 16757)
-- Dependencies: 212
-- Data for Name: ProductReview; Type: TABLE DATA; Schema: public; Owner: pp
--

INSERT INTO public."ProductReview" VALUES (1, 1, 7, 'Great, best ball for my cat i have ever used.', 5);
INSERT INTO public."ProductReview" VALUES (2, 2, 5, 'What a joke, my cat seems to love it, but bunny won''t even go near it.', 2);


--
-- TOC entry 3084 (class 0 OID 16796)
-- Dependencies: 214
-- Data for Name: Recommendations; Type: TABLE DATA; Schema: public; Owner: pp
--

INSERT INTO public."Recommendations" VALUES (1, 3, 1);
INSERT INTO public."Recommendations" VALUES (2, 5, 1);
INSERT INTO public."Recommendations" VALUES (3, 6, 2);


--
-- TOC entry 3094 (class 0 OID 16889)
-- Dependencies: 224
-- Data for Name: ShoppingCart; Type: TABLE DATA; Schema: public; Owner: pp
--

INSERT INTO public."ShoppingCart" VALUES (1, 3, 2, 5);
INSERT INTO public."ShoppingCart" VALUES (2, 5, 3, 1);


--
-- TOC entry 3074 (class 0 OID 16657)
-- Dependencies: 204
-- Data for Name: Ticket; Type: TABLE DATA; Schema: public; Owner: pp
--

INSERT INTO public."Ticket" VALUES (1, 3, 'I can''t login with my account user name troll. I am asking my friend to write this for me as she can login to submit this ticket.', 'Completed');
INSERT INTO public."Ticket" VALUES (2, 5, 'Why do you not have more stuff for dogs but lots of stuff for cats? Its unfair.', 'Ignore');
INSERT INTO public."Ticket" VALUES (3, 6, 'I can''t find cool red ball, are you out of it or no longer selling it?', 'Pending');


--
-- TOC entry 3100 (class 0 OID 16953)
-- Dependencies: 230
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: pp
--

INSERT INTO public."User" VALUES (1, 'Thor', '123', 'thor@test.email');
INSERT INTO public."User" VALUES (3, 'test', '123', 'test@test.email');
INSERT INTO public."User" VALUES (5, 'new_dummy', '123', 'new_dummy@test.email');
INSERT INTO public."User" VALUES (6, 'doll', '123', 'doll@test.email');
INSERT INTO public."User" VALUES (7, 'troll', '123', 'troll@test.email');


--
-- TOC entry 3086 (class 0 OID 16814)
-- Dependencies: 216
-- Data for Name: UserGroup; Type: TABLE DATA; Schema: public; Owner: pp
--

INSERT INTO public."UserGroup" VALUES (1, 1, 3, 'member');
INSERT INTO public."UserGroup" VALUES (2, 5, 3, 'admin');
INSERT INTO public."UserGroup" VALUES (3, 6, 3, 'moderator');
INSERT INTO public."UserGroup" VALUES (4, 7, 3, 'member');
INSERT INTO public."UserGroup" VALUES (5, 6, 4, 'member');
INSERT INTO public."UserGroup" VALUES (6, 7, 4, 'admin');
INSERT INTO public."UserGroup" VALUES (7, 3, 5, 'admin');
INSERT INTO public."UserGroup" VALUES (8, 7, 5, 'moderator');


--
-- TOC entry 3098 (class 0 OID 16915)
-- Dependencies: 228
-- Data for Name: UserPost; Type: TABLE DATA; Schema: public; Owner: pp
--

INSERT INTO public."UserPost" VALUES (1, 3, 'Rolig text', '2022-02-10 13:37:44.258812', NULL);
INSERT INTO public."UserPost" VALUES (2, 5, 'roligt svar', '2022-02-10 13:37:44.258812', 1);
INSERT INTO public."UserPost" VALUES (3, 6, 'intressant post', '2022-02-10 13:38:32.829118', NULL);
INSERT INTO public."UserPost" VALUES (4, 7, 'kretik p\xe5 intressant post', '2022-02-10 13:38:32.829118', 3);


--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 207
-- Name: CardPayment_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: pp
--

SELECT pg_catalog.setval('public."CardPayment_ID_seq"', 2, true);


--
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 221
-- Name: GroupPost_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: pp
--

SELECT pg_catalog.setval('public."GroupPost_ID_seq"', 4, true);


--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 205
-- Name: Group_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: pp
--

SELECT pg_catalog.setval('public."Group_ID_seq"', 5, true);


--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 219
-- Name: Message_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: pp
--

SELECT pg_catalog.setval('public."Message_ID_seq"', 5, true);


--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 217
-- Name: OrderProduct_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: pp
--

SELECT pg_catalog.setval('public."OrderProduct_ID_seq"', 4, true);


--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 209
-- Name: Order_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: pp
--

SELECT pg_catalog.setval('public."Order_ID_seq"', 3, true);


--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 211
-- Name: ProductReview_ID _seq; Type: SEQUENCE SET; Schema: public; Owner: pp
--

SELECT pg_catalog.setval('public."ProductReview_ID _seq"', 2, true);


--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 213
-- Name: Recommendations_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: pp
--

SELECT pg_catalog.setval('public."Recommendations_ID_seq"', 3, true);


--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 223
-- Name: ShoppingCart_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: pp
--

SELECT pg_catalog.setval('public."ShoppingCart_ID_seq"', 2, true);


--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 203
-- Name: Ticket_ID _seq; Type: SEQUENCE SET; Schema: public; Owner: pp
--

SELECT pg_catalog.setval('public."Ticket_ID _seq"', 3, true);


--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 215
-- Name: UserGroup_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: pp
--

SELECT pg_catalog.setval('public."UserGroup_ID_seq"', 8, true);


--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 227
-- Name: UserPost_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: pp
--

SELECT pg_catalog.setval('public."UserPost_ID_seq"', 4, true);


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 229
-- Name: User_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: pp
--

SELECT pg_catalog.setval('public."User_ID_seq"', 7, true);


--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 225
-- Name: product_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: pp
--

SELECT pg_catalog.setval('public."product_ID_seq"', 4, true);


--
-- TOC entry 2903 (class 2606 OID 16705)
-- Name: CardPayment CardPayment_pkey; Type: CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."CardPayment"
    ADD CONSTRAINT "CardPayment_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2917 (class 2606 OID 16874)
-- Name: GroupPost GroupPost_pkey; Type: CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."GroupPost"
    ADD CONSTRAINT "GroupPost_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2901 (class 2606 OID 16692)
-- Name: Group Group_pkey; Type: CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Group"
    ADD CONSTRAINT "Group_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2915 (class 2606 OID 16856)
-- Name: Message Message_pkey1; Type: CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Message"
    ADD CONSTRAINT "Message_pkey1" PRIMARY KEY ("ID");


--
-- TOC entry 2913 (class 2606 OID 16837)
-- Name: OrderProduct OrderProduct_pkey; Type: CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."OrderProduct"
    ADD CONSTRAINT "OrderProduct_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2905 (class 2606 OID 16726)
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2907 (class 2606 OID 16765)
-- Name: ProductReview ProductReview_pkey; Type: CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."ProductReview"
    ADD CONSTRAINT "ProductReview_pkey" PRIMARY KEY ("ID ");


--
-- TOC entry 2909 (class 2606 OID 16801)
-- Name: Recommendations Recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Recommendations"
    ADD CONSTRAINT "Recommendations_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2919 (class 2606 OID 16894)
-- Name: ShoppingCart ShoppingCart_pkey; Type: CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."ShoppingCart"
    ADD CONSTRAINT "ShoppingCart_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2899 (class 2606 OID 16665)
-- Name: Ticket Ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Ticket"
    ADD CONSTRAINT "Ticket_pkey" PRIMARY KEY ("ID ");


--
-- TOC entry 2911 (class 2606 OID 16819)
-- Name: UserGroup UserGroup_pkey; Type: CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."UserGroup"
    ADD CONSTRAINT "UserGroup_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2923 (class 2606 OID 16920)
-- Name: UserPost UserPost_pkey1; Type: CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."UserPost"
    ADD CONSTRAINT "UserPost_pkey1" PRIMARY KEY ("ID");


--
-- TOC entry 2925 (class 2606 OID 16958)
-- Name: User User_pkey1; Type: CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey1" PRIMARY KEY ("ID");


--
-- TOC entry 2921 (class 2606 OID 16912)
-- Name: Product product_pkey; Type: CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT product_pkey PRIMARY KEY ("ID");


--
-- TOC entry 2929 (class 2606 OID 16727)
-- Name: Order CardPayment_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "CardPayment_id" FOREIGN KEY ("CardPayment_id") REFERENCES public."CardPayment"("ID") NOT VALID;


--
-- TOC entry 2935 (class 2606 OID 16825)
-- Name: UserGroup Group_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."UserGroup"
    ADD CONSTRAINT "Group_id" FOREIGN KEY ("Group_id") REFERENCES public."Group"("ID") NOT VALID;


--
-- TOC entry 2941 (class 2606 OID 16880)
-- Name: GroupPost Group_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."GroupPost"
    ADD CONSTRAINT "Group_id" FOREIGN KEY ("Group_id") REFERENCES public."Group"("ID") NOT VALID;


--
-- TOC entry 2937 (class 2606 OID 16839)
-- Name: OrderProduct Order_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."OrderProduct"
    ADD CONSTRAINT "Order_id" FOREIGN KEY ("Order_id") REFERENCES public."Order"("ID") NOT VALID;


--
-- TOC entry 2931 (class 2606 OID 16921)
-- Name: ProductReview Product_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."ProductReview"
    ADD CONSTRAINT "Product_id" FOREIGN KEY ("Product_id") REFERENCES public."Product"("ID") NOT VALID;


--
-- TOC entry 2933 (class 2606 OID 16926)
-- Name: Recommendations Product_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Recommendations"
    ADD CONSTRAINT "Product_id" FOREIGN KEY ("Product_id") REFERENCES public."Product"("ID") NOT VALID;


--
-- TOC entry 2938 (class 2606 OID 16931)
-- Name: OrderProduct Product_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."OrderProduct"
    ADD CONSTRAINT "Product_id" FOREIGN KEY ("Product_id") REFERENCES public."Product"("ID") NOT VALID;


--
-- TOC entry 2943 (class 2606 OID 16936)
-- Name: ShoppingCart Product_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."ShoppingCart"
    ADD CONSTRAINT "Product_id" FOREIGN KEY ("Product_id") REFERENCES public."Product"("ID") NOT VALID;


--
-- TOC entry 2945 (class 2606 OID 17840)
-- Name: UserPost UserPost_reply_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."UserPost"
    ADD CONSTRAINT "UserPost_reply_id" FOREIGN KEY ("UserPost_reply_id") REFERENCES public."UserPost"("ID") NOT VALID;


--
-- TOC entry 2928 (class 2606 OID 16959)
-- Name: CardPayment User_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."CardPayment"
    ADD CONSTRAINT "User_id" FOREIGN KEY ("User_id") REFERENCES public."User"("ID") NOT VALID;


--
-- TOC entry 2942 (class 2606 OID 16969)
-- Name: GroupPost User_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."GroupPost"
    ADD CONSTRAINT "User_id" FOREIGN KEY ("User_id") REFERENCES public."User"("ID") NOT VALID;


--
-- TOC entry 2930 (class 2606 OID 16974)
-- Name: Order User_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "User_id" FOREIGN KEY ("User_id") REFERENCES public."User"("ID") NOT VALID;


--
-- TOC entry 2932 (class 2606 OID 16989)
-- Name: ProductReview User_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."ProductReview"
    ADD CONSTRAINT "User_id" FOREIGN KEY ("User_id") REFERENCES public."User"("ID") NOT VALID;


--
-- TOC entry 2934 (class 2606 OID 16994)
-- Name: Recommendations User_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Recommendations"
    ADD CONSTRAINT "User_id" FOREIGN KEY ("User_id") REFERENCES public."User"("ID") NOT VALID;


--
-- TOC entry 2944 (class 2606 OID 16999)
-- Name: ShoppingCart User_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."ShoppingCart"
    ADD CONSTRAINT "User_id" FOREIGN KEY ("User_id") REFERENCES public."User"("ID") NOT VALID;


--
-- TOC entry 2926 (class 2606 OID 17004)
-- Name: Ticket User_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Ticket"
    ADD CONSTRAINT "User_id" FOREIGN KEY ("User_id") REFERENCES public."User"("ID") NOT VALID;


--
-- TOC entry 2936 (class 2606 OID 17009)
-- Name: UserGroup User_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."UserGroup"
    ADD CONSTRAINT "User_id" FOREIGN KEY ("User_id") REFERENCES public."User"("ID") NOT VALID;


--
-- TOC entry 2946 (class 2606 OID 17014)
-- Name: UserPost User_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."UserPost"
    ADD CONSTRAINT "User_id" FOREIGN KEY ("User_id") REFERENCES public."User"("ID") NOT VALID;


--
-- TOC entry 2927 (class 2606 OID 18841)
-- Name: Group User_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Group"
    ADD CONSTRAINT "User_id" FOREIGN KEY ("User_id") REFERENCES public."User"("ID") NOT VALID;


--
-- TOC entry 2939 (class 2606 OID 16979)
-- Name: Message from_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Message"
    ADD CONSTRAINT from_user_id FOREIGN KEY ("from_User_id") REFERENCES public."User"("ID") NOT VALID;


--
-- TOC entry 2940 (class 2606 OID 16984)
-- Name: Message to_User_id; Type: FK CONSTRAINT; Schema: public; Owner: pp
--

ALTER TABLE ONLY public."Message"
    ADD CONSTRAINT "to_User_id" FOREIGN KEY ("to_User_id") REFERENCES public."User"("ID") NOT VALID;


-- Completed on 2022-02-10 14:59:38

--
-- PostgreSQL database dump complete
--

