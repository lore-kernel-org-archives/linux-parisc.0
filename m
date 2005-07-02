From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] Matrox Mystique video card NOT initialized on HP Visualize 785/B2000 with 2.6.12-rc6-pa1kernel
Date: Sat, 2 Jul 2005 03:45:46 +0100
Message-ID: <e6eae02905070119457ef4cb60__32309.7924971536$1416623828$gmane$org@mail.gmail.com>
References: <5.1.1.6.1.20050701213229.02ab2910@pop.singnet.com.sg>
Reply-To: Max Grabert <parisc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: "J. L. Lee" <jllee@singnet.com.sg>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <5.1.1.6.1.20050701213229.02ab2910@pop.singnet.com.sg>
Resent-Message-ID: <SzhZdD.A.qXG.6NgxCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On 7/1/05, J. L. Lee <jllee@singnet.com.sg> wrote:
>  Hi,
>=20
>  I have now upgraded to Linux Kernel 2.6.12-rc6-pa1 but am still having
> problems in getting Matrox Mystique video card up and running, i.e. the c=
ard
> did not get initialized. At least it didn't cause Kernel panic as it did =
in
> 2.6.8.  (The driver is compiled into the kernel.)

Have you read the FAQ (http://www.parisc-linux.org/faq/graphics-howto.html)=
 ?
Especially this bit:

"But some graphics drivers might have minor issues.
E.g. to ensure the Matrox Millenium graphics card will be initialized prope=
rly=20
one must physically disconnect the computer from the power line before=20
(re)booting - it is not sufficient to just press the power-off button."

  Max
