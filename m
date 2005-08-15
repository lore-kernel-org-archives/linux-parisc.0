From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] PCI card in C160
Date: Mon, 15 Aug 2005 08:01:29 +0100
Message-ID: <e6eae02905081500015824bbf1@mail.gmail.com>
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

BTW, are you really sure you don't have any PCI (UHCI/OHCI/EHCI) USB
card installed somewhere? It would be rather strange if it falsly
identifies your ethernet card as a USB card ...

   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
