From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [klibc] [parisc-linux] klibc parisc64
Date: Mon, 24 Jul 2006 23:09:49 -0400
Message-ID: <20060725030949.GA7480@hiauly1.hia.nrc.ca>
References: <200607242311.k6ONBMY0004933@hiauly1.hia.nrc.ca>
	<44C554F9.9020402@zytor.com>
	<20060725014634.GA4313@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: klibc@zytor.com,
 parisc-linux@lists.parisc-linux.org,
 "H. Peter Anvin" <hpa@zytor.com>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060725014634.GA4313@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jul 24, 2006 at 09:46:34PM -0400, Kyle McMartin wrote:
> On Mon, Jul 24, 2006 at 04:17:13PM -0700, H. Peter Anvin wrote:
> > OK, well then it's probably pointless to try to get 64-bit klibc up and 
> > running on it at this point.  That's fine, though; we can just use 32-bit.
> > 
> 
> Just means I need to learn to hack binutils. No big deal. :)

Patches to clean up the relationship between hpux and linux, and
to define the linux 64-bit runtime are welcome.  For example,
we have in hppa64linux.sh:

SCRIPT_NAME=elf
ELFSIZE=64
# FIXME: this output format is for hpux.
OUTPUT_FORMAT="elf64-hppa-linux"
...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
