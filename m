Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA27750
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Jan 2001 07:27:08 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 23 Jan 2001 14:31:00 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14L4TD-0004Lc-00; Tue, 23 Jan 2001 14:30:51 +0000
Date: Tue, 23 Jan 2001 14:30:51 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Modra <alan@linuxcare.com.au>
Cc: Richard Hirst <rhirst@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] parisc64 kernel and ret1 (gr29) setup
Message-ID: <20010123143051.A12476@parcelfarce.linux.theplanet.co.uk>
References: <20010123134545.W3571@linuxcare.com> <Pine.LNX.4.21.0101240116440.29059-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0101240116440.29059-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Wed, Jan 24, 2001 at 01:20:34AM +1100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jan 24, 2001 at 01:20:34AM +1100, Alan Modra wrote:
> > I was just going to increase to 80 bytes - 64 bytes save area plus
> > 16 for rp and sp - but Willy thought there was a requirement for the
> > stack to be 64 byte aligned.
> 
> Yup.
> 
> Is there any code elsewhere that "knows" the stack frame is 64 bytes
> (except for gdb and signal handler frames)?

i'm not sure that's the point... knowing the stack frame is 64 byte
aligned allows the compiler to know the alignment of all types being
placed on the stack.

-- 
Revolutions do not require corporate support.
