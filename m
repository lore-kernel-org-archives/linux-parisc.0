From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] New debian libc6 2.3.5: glibc bug or kernel bug???
Date: Fri, 12 Aug 2005 11:12:22 +0200
Message-ID: <IL3QWM$278508E649D2E698C2052478A717F917@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "kyle" <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Thu, Aug 11, 2005 at 06:03:54PM +0200, Joel Soete wrote:
> > mmm, I am looking to the diff between 2.6.11 and 2.6.12 in p-l field =
only
> > (i.e. arch/parisc and include/asm-parisc) and find a few related to t=
hreads
> > excepted those hunks:
> 
> This should only effect unaligned traps, and only if the process has
> flags set with prctl.

Ok

Thanks a lot,
    Joel=0A=0A-----------------------------------------------------------=
----=0AA free anti-spam and anti-virus filter on all Scarlet mailboxes=0A=
More info on http://www.scarlet.be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
