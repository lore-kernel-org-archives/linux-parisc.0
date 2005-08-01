From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Feature request for parsic kernel hackers
	(2	mini-projects)
Date: Mon, 1 Aug 2005 10:26:48 -0400
Message-ID: <20050801142644.GV9703@systemhalted.org>
References: <20050801045734.GU9703@systemhalted.org>
	<42EDF278.5080403@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42EDF278.5080403@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Aug 01, 2005 at 05:59:20PM +0800, Randolph Chung wrote:
> > 2. Add some option that enables the user to print something
> >    like /proc/self/maps when a user process dies. This is 
> >    very usefull for translating a fault address into a quick
> >    estimate of which library function crashed.
> 
> gdb?

If I can't reproduce the crash in the debugger? In particular the PA8800
crashes are so weird that I can't get the same thing under the debugger.

Also, when a process dies in gdb 6.x it throws away the process information
and I can't look at the maps anymore. I have to let it die, remember
where it died, start it again and then hope the DSO loading was
deterministic (e.g. No weird use of dlopen).

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
