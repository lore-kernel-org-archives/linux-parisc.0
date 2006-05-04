From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: hppa64-...-gcc-4.1 annoying pb?
Date: Thu, 4 May 2006 13:12:45 -0400 (EDT)
Message-ID: <200605041712.k44HCjdF013051@hiauly1.hia.nrc.ca>
References: <IYR3CA$4C8410124A8041A4F76C25F0B0AF5127@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IYR3CA$4C8410124A8041A4F76C25F0B0AF5127@scarlet.be> from "Joel
	Soete" at May 4, 2006 07:02:34 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Suggests that 4.1 has gone wild inlining.  To some extent, inlining
> > depends on the amount of memory present in the build machine.
> > 
> the 64bit build was on the N4k (up kernel) with ram of 4Gb:
> # cat /proc/meminfo
> MemTotal:      4115368 kB

You might see if limiting virtual memory helps.  I have the following
in bash.bashrc:

# limit process virtual memory
ulimit -v 524288

This is on a machine with 1 GB.  I had found that the VM system
could thrash and the system crash when it tried to allocate about
1 GB.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
