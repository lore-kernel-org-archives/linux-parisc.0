From: Thibaut VARENE <varenet@esiee.fr>
Subject: [parisc-linux] Re: Depmod unresolved symbols when upgrading to
	2.4.18-32-smp on J6000
Date: Mon, 7 Jun 2004 19:52:15 +0200
Message-ID: <6953A7F8-B8AB-11D8-9561-0030656F07A2@esiee.fr>
References: <FHEGKPBPFFGIFBGOANOKOEMHEGAA.h.cochran@comcast.net>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Type: multipart/mixed;
  boundary="===============0682246311=="
Cc: parisc-linux@lists.parisc-linux.org
To: "Harry Cochran" <h.cochran@comcast.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <FHEGKPBPFFGIFBGOANOKOEMHEGAA.h.cochran@comcast.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--===============0682246311==
Content-Type: multipart/alternative; boundary=Apple-Mail-2-949352994


--Apple-Mail-2-949352994
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed


Le lundi, 7 juin 2004, =E0 19:40 Europe/Paris, Harry Cochran a =E9crit :

> Hi Thibaut,
>
> =A0=A0=A0=A0=A0=A0=A0 After fighting some other fires, I'm back to the =
J6000 smp=20
> problem. I have to admit that I've never built a custom kernel before=20=

> (although I have had gcc problems before :-). Are you sure I can't use=20=

> any of the kernels listed on the=20
> http://cvs.parisc-linux.org/download/linux-2.4/ page? Also, I have to=20=

> admit that I tried putting=20
> "http://cvs.parisc-linux.org/download/linux-2.4/autobuild/32smp/ ./"=20=

> in sources.list and doing an apt-cache search=20
> palinux-32smp-2.4.26-pa4. This returned "Couldn't stat source package=20=

> list" (2 no such file or directory). If I can use a pre-built kernel,=20=

> I would really appreciate your insight into what I put into=20
> sources.list and then the exact form of the apt-get install that I=20
> should do. If I really do need to build a custom kernel, I'll have to=20=

> go off and figure out how to do that.
>
I never said you couldn't use autobuild kernels

and your apt question should be asked to the list, since i don't know=20
why it doesn't work, and that your experience may be useful to others.

finally, both parisc-linux and pateam websites have docs on how to=20
build custom kernels.

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://www.pateam.org/=

--Apple-Mail-2-949352994
Content-Transfer-Encoding: quoted-printable
Content-Type: text/enriched;
	charset=ISO-8859-1



Le lundi, 7 juin 2004, =E0 19:40 Europe/Paris, Harry Cochran a =E9crit :


<excerpt><fontfamily><param>Arial</param><smaller>Hi Thibaut,


=A0=A0=A0=A0=A0=A0=A0 After fighting some other fires, I'm back to the =
J6000 smp
problem. I have to admit that I've never built a custom kernel before
(although I have had gcc problems before :-). Are you sure I can't use
any of the kernels listed on the
=
<underline><color><param>0000,6666,0000</param>http://cvs.parisc-linux.org=
/download/linux-2.4/</color></underline>
page? Also, I have to admit that I tried putting
=
"<underline><color><param>0000,0000,0000</param>http://cvs.parisc-linux.or=
g/download/linux-2.4/autobuild/32smp/</color></underline>
./" in sources.list and doing an apt-cache search
palinux-32smp-2.4.26-pa4. This returned "Couldn't stat source package
list" (2 no such file or directory). If I can use a pre-built kernel,
I would really appreciate your insight into what I put into
sources.list and then the exact form of the apt-get install that I
should do. If I really do need to build a custom kernel, I'll have to
go off and figure out how to do that.</smaller></fontfamily>


</excerpt>I never said you couldn't use autobuild kernels


and your apt question should be asked to the list, since i don't know
why it doesn't work, and that your experience may be useful to others.


finally, both parisc-linux and pateam websites have docs on how to
build custom kernels.


HTH,



Thibaut VARENE

The PA/Linux ESIEE Team

http://www.pateam.org/=

--Apple-Mail-2-949352994--


--===============0682246311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0682246311==--
