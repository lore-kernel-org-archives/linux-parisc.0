From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: parisc: flush pages through tmpalias space
Date: Sat, 1 Jan 2011 13:31:08 -0500
Message-ID: <20110101183108.GA19035@hiauly1.hia.nrc.ca>
References: <1293034931.3019.8.camel@mulgrave.site> <20101229042346.GA973@hiauly1.hia.nrc.ca> <1293634281.2803.4.camel@fuzzy> <20101230155640.GA7058@hiauly1.hia.nrc.ca> <20101230160944.GA7360@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101230160944.GA7360@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 30 Dec 2010, John David Anglin wrote:

> On Thu, 30 Dec 2010, John David Anglin wrote:
> 
> > Attached is an application that triggers similar errors:

Here is a simpler testcase:

int main ()
{
  asm ("stw %r0,0(%r0)"); /* Generate null pointer exception */
  return 0;
}

With the above, I get the following INEQUIVALENT ALIASES messages:

Jan  1 10:23:19 gsyprf11 kernel: [135942.140000] INEQUIVALENT ALIASES 0x406b1000 and 0x406b0000 in file libc-2.11.2.so
Jan  1 10:23:19 gsyprf11 kernel: [135942.224000] INEQUIVALENT ALIASES 0x406b1000 and 0x406b0000 in file libc-2.11.2.so

Running with strace, I see the following mmap call:

mmap(0x406b1000, 28672, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x158000) = 0x406b1000

This is from glibc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
