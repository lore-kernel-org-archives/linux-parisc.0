From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: [PATCH 32/66] arch/parisc/include/asm/parport.h: Checkpatch
	cleanup
Date: Sat, 27 Feb 2010 23:18:18 +0100
Message-ID: <7d01f9f01002271418j185821a3h447c89a43406254d@mail.gmail.com>
References: <1267289508-31031-1-git-send-email-andrea.gelmini@gelma.net>
	 <1267289508-31031-33-git-send-email-andrea.gelmini@gelma.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-kernel@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Andrea Gelmini <andrea.gelmini@gelma.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1267289508-31031-33-git-send-email-andrea.gelmini@gelma.net>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Feb 27, 2010 at 5:51 PM, Andrea Gelmini
<andrea.gelmini@gelma.net> wrote:
> arch/parisc/include/asm/parport.h:1: ERROR: trailing whitespace
> arch/parisc/include/asm/parport.h:11: WARNING: space prohibited betwe=
en function name and open parenthesis '('
>
> Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
> ---
> =C2=A0arch/parisc/include/asm/parport.h | =C2=A0 =C2=A05 ++---
> =C2=A01 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/parisc/include/asm/parport.h b/arch/parisc/include/=
asm/parport.h
> index 00d9cc3..5cbf98b 100644
> --- a/arch/parisc/include/asm/parport.h
> +++ b/arch/parisc/include/asm/parport.h

> @@ -8,8 +8,7 @@
> =C2=A0#define _ASM_PARPORT_H 1
>
>
> -static int __devinit parport_pc_find_nonpci_ports (int autoirq, int =
autodma)
> -{
> +static int __devinit parport_pc_find_nonpci_ports (int autoirq, int =
autodma) {

This looks very much in contradiction with CodingStyle, since
parport_pc_find_nonpci_ports() is a function, and it's not a fix for
the quoted "WARNING". I'm guessing this wasn't intended the way it is.

HTH

T-Bone

--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
