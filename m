Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA13300
	for <parisc-linux@puffin.external.hp.com>; Sat, 16 Dec 2000 12:45:28 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 16 Dec 2000 19:43:05 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 147N1D-0002pM-00; Sat, 16 Dec 2000 19:29:19 +0000
Date: Sat, 16 Dec 2000 19:29:19 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Jes Sorensen <jes@linuxcare.com>
Cc: Matthew Wilcox <matthew@wil.cx>, Alan Modra <alan@linuxcare.com.au>,
        John Marvin <jsm@udlkern.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
Message-ID: <20001216192919.A10477@parcelfarce.linux.theplanet.co.uk>
References: <200012151012.DAA05988@udlkern.fc.hp.com> <Pine.LNX.4.21.0012152235260.7608-100000@front.linuxcare.com.au> <20001215163714.A22147@parcelfarce.linux.theplanet.co.uk> <d3ae9xmvz7.fsf@lxplus015.cern.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <d3ae9xmvz7.fsf@lxplus015.cern.ch>; from jes@linuxcare.com on Fri, Dec 15, 2000 at 06:32:12PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Dec 15, 2000 at 06:32:12PM +0100, Jes Sorensen wrote:
> >>>>> "Matthew" == Matthew Wilcox <matthew@wil.cx> writes:
> 
> Matthew> Can we move the __spinlock to be the first element of the
> Matthew> struct, and then mark the struct as requiring 16-byte
> Matthew> alignment?  i have the feeling this might `just work', since
> Matthew> most structs will be allocated at 16-byte-aligned addresses
> Matthew> anyway.
> 
> We probably cannot, we can however create our own version of the
> header file for the parisc port.

That was what I meant.  the question is, would it _work_?  Or is this
struct embedded in other structs at non-16byte-aligned positions?

-- 
Revolutions do not require corporate support.
