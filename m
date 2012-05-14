From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Linux 3.4-rc7
Date: Sun, 13 May 2012 20:42:26 -0400
Message-ID: <BLU0-SMTP4CED805E93EF3D8DA2198971A0@phx.gbl>
References: <CA+55aFzsygnrJwLUPV8Vg4RPmwxXLuY-uo70fBLEZR8+barT5A@mail.gmail.com> <4FB011E7.1000604@linux.vnet.ibm.com> <BLU0-SMTP22F4864AE1F54838C150D797150@phx.gbl> <4FB0197F.6010000@linux.vnet.ibm.com> <BLU0-SMTP85D30AAA2BF2CF07B1039897150@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Mikulas Patocka <mpatocka@redhat.com>, stepanm@codeaurora.org,
	Thomas Gleixner <tglx@linutronix.de>,
	James.Bottomley@hansenpartnership.com, deller@gmx.de,
	dhowells@redhat.com, yasutake.koichi@jp.panasonic.com,
	eike-kernel@sf-tec.de, linux-parisc@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP85D30AAA2BF2CF07B1039897150@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 13-May-12, at 4:40 PM, John David Anglin wrote:

> Yes, the revised change fixes the compilation error.  I'll know in a  
> while if
> my config boots.


I successfully booted 3.4-rc7 with this change on rp3440 (4 cpu smp).   
My build also
included cache and other fixes that are being discussed on the parisc  
list.

Dave
--
John David Anglin	dave.anglin@bell.net



