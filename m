From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: glibc hppa build failure - ulimit
Date: Fri, 13 May 2005 18:45:35 +0100
Message-ID: <20050513174535.GH10567__49741.1771597855$1416624538$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <20050513161718.GA9620@nevyn.them.org> <20050513163833.GG10567@parcelfarce.linux.theplanet.co.uk> <20050513172148.GA12680@nevyn.them.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: debian-admin@lists.debian.org,
 debian-glibc@lists.debian.org,
 debian-hppa@lists.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20050513172148.GA12680@nevyn.them.org>
Resent-Message-ID: <8KgGoC.A.swE.jyOhCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Fri, May 13, 2005 at 01:21:48PM -0400, Daniel Jacobowitz wrote:
> On Fri, May 13, 2005 at 05:38:33PM +0100, Matthew Wilcox wrote:
> > On Fri, May 13, 2005 at 12:17:18PM -0400, Daniel Jacobowitz wrote:
> > > 27319 mmap(NULL, 1073741824, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0 <unfinished ...>
> > > 27319 <... mmap resumed> )              = -1 ENOMEM (Cannot allocate memory)
> > > 
> > > Right now I don't think we could even rebuild glibc -21.  The hppa
> > > machines are configured with ulimit -s set to 1GB.  This makes
> > > LinuxThreads use 1GB thread stacks.  Which is, um, pretty bad.
> > 
> > PA machines grow the stack upwards, starting at 0xffffffff - hard
> > stack limit.  glibc never used to pay attention to the stack limit,
> > choosing always to use 4MB stacks (iirc).  When did glibc change that?
> 
> Probably when Carlos added a patch to glibc which defined
> FLOATING_STACKS.  Glibc throttles the size to 8MB if the rlimit is
> infinity, but trusts the rlimit if it is explicitly larger than 8MB.

Ugh.  Can we change the logic there to throttle to 8MB if the rlimit is
larger than 1GB and we're building a 32-bit libc?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
