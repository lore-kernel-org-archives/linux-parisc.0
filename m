From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] PCI card in C160
Date: Mon, 15 Aug 2005 07:51:57 +0100
Message-ID: <e6eae0290508142351585ba614@mail.gmail.com>
References: <430035F8.9040900@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Kurt Fitzner <kfitzner@excelcia.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <430035F8.9040900@excelcia.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 15/08/05, Kurt Fitzner <kfitzner@excelcia.org> wrote:
> I am trying to put an Ethernet card into my new (to me) C160 without any
> success.  Any time I put a PCI card in, the machine refused to boot and
> gives me the message:
>=20
>    *****
>    ***** Disabled the PCI USB card in slot 3.
>    *****
>    * *   An unsupported PCI I/O configuration has been detected. * *
>    * *   Contact your HP service representative for warranty     * *
>    * *   service to enable the card(s) listed above.             * *

Errm, I can't say for sure, but IIRC there was a time when HP thought
it is useful to just allow HP certified/supported PCI cards to run in
their workstations.
Perhaps someone else can elaborate on that topic?

> I had no trouble with putting a card in my B132L, but it seems to be
> more forgiving of hardware.  It has a 5v PCI bus where the C160 is 3.3v.
>=20
> I've tried two different Ethernet cards and also a USB card I had lying
> around - every card I have that was keyed for 3.3v.

Well, many cards are universal, ie. keyed for both 3.3v and 5v.

> I've updated to the latest firmware with no change.
>=20
> I know this is a little off topic for the list, but it's my guess that
> not very many other people except Linux users are putting weird hardware
> in their PARISC workstations.
>=20
> Anyways, if anyone knows of ethernet cards that will work on a C160 - if
> you have similar hardware and a success story - I would appreciate
> hearing about it.

I can't speak about C160, but in my C240 I was able to use a
DEC tulip and also a Intel EtherExpress PRO 100.
I didn't have so much luck with a noname ne2k and some 3com Vortex,
but it was about 3-4 years ago since I last tried ...
Anyway I think a DEC Tulip card should be your best bet.

   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
