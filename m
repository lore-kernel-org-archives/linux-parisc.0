Return-Path: <hppa-linux@puffingroup.com>
Message-Id: <1.5.4.32.19990218035120.006a41ec@pop3.sprint.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Wed, 17 Feb 1999 22:51:20 -0500
To: hppa-linux@puffingroup.com
From: Tomasz Korycki <tkorycki@sprint.ca>
Subject: Re: [hppa-linux] NIC
Resent-Message-ID: <"F0_602.0.sw6.Pxuos"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

Try ifconfig lan0 x.y.z.a up - without netmask (let it assign std netmask).
I seem to remember some troubles with 700 in that respect. Good Luck!

At 18:23 99-02-17 -0800, you wrote:
>Ok, I know this is not totally relevant to linux itself but I need to get
my 735/99 up and running before I can be of help :)
>
>Since a crash last saturday, I cannot get my network up anymore, when I do 
>lanscan it gives me 
>
>path 2.0.2  address  0x080009629AC0 lu 0 State DOWN 
>NameUnit lan0 State DOWN ID4 method ETHER number 52
>
>ioscan recognizes it, at boot it detects the hardware device but whenever I
do ifconfig 10.0.0.5 netmask 255.255.255.0 up it comes back with no such device
>
>I have no clue what to do anymore, I tried different transceivers..nada...
the lights on the transceiver are on so that seems to be ok.
>
>any hints ? Without that I will have to move a scsi disk out and put the
mklinux image on it and stuff  whihc I don'mt mind doing but I rather have
my network up and go from there
>
>thanks
>
>----------------------------------------------------------------------
>To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
>`unsubscribe' as the subject.
>
>
(-) Tom Korycki

This is my public key:

-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: PGPfreeware 5.5.5 for non-commercial use <http://www.nai.com>

mQGiBDU2NaQRBADxRUcXNcYDuQnQPmHTSY21WFR5kg8yckVlHtgVLFI6qt8qvKFi
vLB926sYwcP/tdp6mFnzBbK3/O0IG6U6npzMYTDOdCY3vEo1iMyzCk27GNkUte1P
+K8r2fU7K7SvwMWU4LeRklXE9s2jPvp2UPs5ygr7DSHZI2Kd8/sYR/12WQCg/1kg
SIzwFHEC7ihTgbrT1/vXD0cEAM15+oGZBJ7146pxSzrxUj1676g11o+jLTeEsEMR
ieSl+7XMg5aPznWSnbrxnbepUSZraMKpj1d4RlP3NHnJA7vOwD9hxQsYg9ExFjqk
b+bdaroGMnekh4U33Uud1rrDpIev6j5IX+6+sJmXR5mG52EzI9Aeae+lDxLJM8sH
OAZEA/4w+NAEtC4NiaEuTxhHFhqPtmtY70BZeHBS9ckw3gtLwEHHG9o2MKuKXY9S
JCIK0DUZ2Qu8xbmrw3bvQ8gKxLC/H9RRI5kDqeI7SupBGSpJXl3G3gp1HnYojr/A
rnNjjaVjjuQJVcC1yj7eSuMLs0za46T7RbPqk02N4C6BDv0PO7QjVG9tYXN6IEtv
cnlja2kgPHRrb3J5Y2tpQHNwcmludC5jYT6JAEsEEBECAAsFAjU2NaQECwMCAQAK
CRDT2DCTp8a3GxBcAKD0jEqWQKcagwiOaYvvkD6pwIQQrwCgldA12j4Zcm9C9USN
g9tg8th05uC5Ag0ENTY1pBAIAPZCV7cIfwgXcqK61qlC8wXo+VMROU+28W65Szgg
2gGnVqMU6Y9AVfPQB8bLQ6mUrfdMZIZJ+AyDvWXpF9Sh01D49Vlf3HZSTz09jdvO
meFXklnN/biudE/F/Ha8g8VHMGHOfMlm/xX5u/2RXscBqtNbno2gpXI61Brwv0YA
WCvl9Ij9WE5J280gtJ3kkQc2azNsOA1FHQ98iLMcfFstjvbzySPAQ/ClWxiNjrtV
jLhdONM0/XwXV0OjHRhs3jMhLLUq/zzhsSlAGBGNfISnCnLWhsQDGcgHKXrKlQzZ
lp+r0ApQmwJG0wg9ZqRdQZ+cfL2JSyIZJrqrol7DVekyCzsAAgIIAILVkIuXNQnl
E7xNV8y+lnwzIeaSVKfsjDUAvuJUPtnmu1D2uUHv/rPb2w1U4SmRo55H2R2nA7qv
EM+aispoBRm4wQsf65bVvXuZZK5QO0Mhw+969PhakYyyKOqO1bBCRibl7K0qzxsW
0Sk9hH1jYER8YOE8pUI1Gllz/wixQ6RMl5qROrNGkQfJFxZQSyEC9OvWoO7GUbzV
Z8+nIFVl79nHelWDFI4/xAvR8GgmhOso/ai/Ysudvv4fWAnnkGw+ls6wmb15Sejz
6RGYBFVV0cI6T6EQGnSLvQQ+dCvrCQUJuHUmOj360BwZVea/zG6TIsG1+oEt1Hgx
g8G7pT13O6qJAEYEGBECAAYFAjU2NaQACgkQ09gwk6fGtxvQdwCgpBVYV2CPPTye
Y4Wxz6L2agWn66wAoLcRvrKG0iE/wtotQqO7QKN5VsLI
=y2e5
-----END PGP PUBLIC KEY BLOCK-----

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
