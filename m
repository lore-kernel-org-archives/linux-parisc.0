From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Random crashes when calling git
Date: Thu, 27 Dec 2012 12:09:35 -0500
Message-ID: <BLU0-SMTP552A5EEA5FEF5F4C363ADC97380@phx.gbl>
References: <4882058.deuBGYmI4J@donald.sf-tec.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4882058.deuBGYmI4J@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 27-Dec-12, at 4:42 AM, Rolf Eike Beer wrote:

> Any ideas?

Try running the test under gdb.  Git has branched to location 0 causing
a page fault.  We need a backtrace(s) to learn something useful.  There
may be multiple backtraces (info thread).

Enable core dumps if not enabled.  Might find something useful by
examining it (gdb -c core /usr/bin/git).

Git uses threads.  I expect the problem is thread related since it  
doesn't
happen all the time, and for that reason it might not be reproducible  
running
under gdb..

You might try building git and running its testsuite.  I remember that
some thread related tests used to fail for me.  I think it may be  
possible
to build git without pthread support.

Dave
--
John David Anglin	dave.anglin@bell.net



