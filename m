From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
	__put_kernel_asm() 64bit?
Date: Tue, 18 Apr 2006 16:35:01 -0400
Message-ID: <119aab440604181335r585ab489je1bef3c952a5a79b@mail.gmail.com>
References: <IXJXEQ$C47DD9AC94AAFC817D7A8379F72B1E8E@scarlet.be>
	<4442A5AB.5080604@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: "Joel Soete" <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4442A5AB.5080604@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 4/16/06, Joel Soete <soete.joel@tiscali.be> wrote:
> Hello all,
>
> I tried to apply my 'beautify' asm template to some uaccess.h and figure =
out that
> this hunk din't mentioned that "r1" was cloberred (iirc in fixup text) wh=
ile
> the 32bit one did:
>
> mmm, doesn't seems to change anything (I just check sys_parisc32.s) but m=
ay be elsewhere?

Please put on your thinking cap.

a) What does a clobber mean from the viewpoint of an __asm?
b) Which insn clobber r1?

Research both and return with the answer.
Double marks if you solve...

c) Should any of the __put_kernel_asm's have r1 listed as a clobber?

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
