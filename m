From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Sun, 3 Jul 2005 14:47:15 -0400 (EDT)
Message-ID: <200507031847.j63IlFQZ016629@hiauly1.hia.nrc.ca>
References: <42C81991.6030502@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42C81991.6030502@tiscali.be> from "Joel Soete" at Jul 3,
	2005 05:00:01 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > good news with gcc-4.0 (debian pakage) and '-mfixed-range=fr6-fr21,fr27-fr31'
> > 
> >     o 2.6.9-rc2-pa1 seems to works as fine as with original option
> >     o 2.6.9-rc2-pa13 the same 
> > 
> > (just have to backport some small stuff to  reach to compile kernels)
> > 
> > I apply my stress test (tar loops + kernel build loops) during a full day
> > for each one without any pb ;-)
> > 
> > I can now try a step forward: 2.6.10-pa + gcc-4.0, ...

I'll have to try a gcc-4.0 built kernel to see if it improves things
on the c3k.

Just a note, a patch to fix the function pointer canonicalization
issue that you and others noticed was installed Friday to the 4.0 branch,
and Saturday to the GCC head.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
