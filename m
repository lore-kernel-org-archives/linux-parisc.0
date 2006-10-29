From: Jeff Bailey <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] [patch] Remove magic constant from gas/tc-hppa.c
Date: Sun, 29 Oct 2006 17:38:10 -0500
Message-ID: <1162161490.18508.13.camel__26059.0940867134$1416624202$gmane$org@localhost.localdomain>
References: <200610292048.k9TKm6lG001929@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0062469753=="
Cc: binutils@sources.redhat.com,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org,
 matthew@wil.cx
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <200610292048.k9TKm6lG001929@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--===============0062469753==
Content-type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-Ptt4tYHIoDBGnrHWTLtS"


--=-Ptt4tYHIoDBGnrHWTLtS
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le dimanche 29 octobre 2006 =C3=A0 15:48 -0500, John David Anglin a =C3=A9c=
rit :
> I think that adding -march=3D{1.0, 1.1, 2.0, 2.0w} to the command
> line options is reasonable.  This together with .level could be
> used to select output format and arch.  I think .level overrides
> the command line option (warning needed).  .level should appear
> before any other directives.  If we need to become more specific
> about the ABI, then an -mabi option could be added.

Because gas calls bfd_openw before the source file has been read,
there's a limit to how much can be changed after that point.  If the
command line asks for 1.1, and the file contains .LEVEL 2.0w, I think
the only solution is to crash out hard.  Otherwise, a warning can be
displayed.

> The tricky part is handling both som and elf64 for hpux, and elf32
> and elf64 for linux.  It will take a fair bit of work to merge the
> bfd stuff.  It may be difficult to do this in a clean manner given
> that the elf and som targets are quite different.

I haven't looked beyond merging elf32 and elf64 yet.  So far I'm trying
to get this patch in before I move onto bfd.  I'd rather not maintain
this out of tree for long.

I have to admit that my target has mostly been for Linux, so elf32 and
elf64.  Are you hoping ideally to have a single gas that could do all
hppa targets?  I think that others have got backends that will do both
aout and elf and such.  I'd have to take a look to see how hard that
would be.

> I think the best plan would be to do the various merges before
> adding the option to select the arch at runtime.

I'd like to see the command line options go in right away (and have them
fail if the target isn't compiled in) so that gcc can be tweaked to pass
the command line options to gas if -m32 or -m64.

> The big problem in supporting multiple ABIs lies in GCC.  The som and
> elf64 targets are essentially incompatible.  There are a number of macros
> which change GCC's behavior depending on whether they are defined or not
> defined.  We have a number of macros that need to be defined in one case
> and not in the other.  Jeff Law used to say it wasn't worth the effort
> to merge the two ports.  I think the same problem is present in binutils
> and gdb.

I think I can at least get the elf targets merged for now in binutils,
which will reduce pain rather than increase it.  If I can get that patch
in, then I'll move along to look at SOM.

For what started off as a 5 line patch, the scope is growing a bit with
every email. =3D)

--
Jeff Bailey - http://www.raspberryginger.com/jbailey/

--=-Ptt4tYHIoDBGnrHWTLtS
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBFRS1S5M5hmdCYCpkRAnAHAJ0Qm5m7MU/4whBUkRTfILji34ECSgCfRNGm
iLIewBUQxIIDqjHErqmYf5k=
=06jO
-----END PGP SIGNATURE-----

--=-Ptt4tYHIoDBGnrHWTLtS--


--===============0062469753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0062469753==--
