From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Fwd: problem installing Debian on HP R class 9000
Date: Mon, 26 Feb 2007 18:36:03 -0700
Message-ID: <20070227013603.GA7420__21538.8568271466$1416624313$gmane$org@colo.lackof.org>
References: <b74751490702220323o3b3d78a9u14b024a75341c986@mail.gmail.com>
	<b74751490702260642i4b1a2538rd384e280e0a24622@mail.gmail.com>
	<20070226165018.GB30763@colo.lackof.org>
	<b74751490702260950i6ed5ef98g219297ad504672fb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: ram <talk2ram@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <b74751490702260950i6ed5ef98g219297ad504672fb@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Feb 26, 2007 at 11:20:50PM +0530, ram wrote:
> >Yeah, this is a known problem. Current workaround is to hack the
> >ccio driver to increase the minimum amount of IOVA space allocated.
> >
> >We need to make this a kernel parameter.
> 
> 
> 
> Hi
> 
> thanks for the quick reply
> can you suggest me some document
> how can i hack the code make my HP R class work with debian

This would require you build your own kernel and integrate it
into the installer. My understanding was Kyle McMartin was
going to do that. Please wait until he can provide an installer
image for you to test.

In general, I haven't looked at our build process in a while.
You can take a look at the "Developer Resources" links at the bottom
of the www.parisc-linux.org navigation bar. The "Build Kernel"
is the most recent one....and it looks stale since it refers
to CVS (which we stopped using about 8 monthes ago).
Use "git" instructions to get kernel source and then follow
the rest of the instructions if you still wish to build
your own kernel.

hth,
grant

> 
> any suggestions or readings
> 
> ram
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
