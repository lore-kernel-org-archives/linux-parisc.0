From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] who?
Date: Sun, 20 Jun 2004 01:20:07 -0600
Message-ID: <20040620072007.GB18353@colo.lackof.org>
References: <200406200204.i5K246dC007504@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200406200204.i5K246dC007504@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jun 19, 2004 at 10:04:06PM -0400, John David Anglin wrote:
> I've noticed that "who" is essentially useless in reporting users who
> are actually logged in.  There seems to be a rather poor cleanup when
> connections die and a user doesn't logout.

Yeah.  I started seeing that in the end of May, IIRC.  X86 works fine.
I had some other fires going and didn't get a chance to look at it.
We could try a 2.4 kernel and see if the same problem exists.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
