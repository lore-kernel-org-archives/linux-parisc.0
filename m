Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA15015
	for <parisc-linux@puffin.external.hp.com>; Sat, 16 Dec 2000 14:58:27 -0700
Sender: Jes.Sorensen@cern.ch
To: Matthew Wilcox <matthew@wil.cx>
Cc: Alan Modra <alan@linuxcare.com.au>, John Marvin <jsm@udlkern.fc.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
References: <200012151012.DAA05988@udlkern.fc.hp.com> <Pine.LNX.4.21.0012152235260.7608-100000@front.linuxcare.com.au> <20001215163714.A22147@parcelfarce.linux.theplanet.co.uk> <d3ae9xmvz7.fsf@lxplus015.cern.ch> <20001216192919.A10477@parcelfarce.linux.theplanet.co.uk>
From: Jes Sorensen <jes@linuxcare.com>
Date: 16 Dec 2000 22:58:56 +0100
In-Reply-To: Matthew Wilcox's message of "Sat, 16 Dec 2000 19:29:19 +0000"
Message-ID: <d38zpgdo4f.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Matthew" == Matthew Wilcox <matthew@wil.cx> writes:

Matthew> On Fri, Dec 15, 2000 at 06:32:12PM +0100, Jes Sorensen wrote:
>>  We probably cannot, we can however create our own version of the
>> header file for the parisc port.

Matthew> That was what I meant.  the question is, would it _work_?  Or
Matthew> is this struct embedded in other structs at
Matthew> non-16byte-aligned positions?

That can be solved by adding an aligned attribute to the struct definition.

Jes
