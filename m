From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Debian install
Date: Fri, 29 Jul 2005 06:39:56 -0600
Message-ID: <20050729123956.GA11883@colo.lackof.org>
References: <42EA19FC.2030500@evonux.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Maxime Woznicki <maxime.woznicki@evonux.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42EA19FC.2030500@evonux.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jul 29, 2005 at 01:58:52PM +0200, Maxime Woznicki wrote:
> Hello,
> 
> I would like to know if debian hppa port supports these differents 
> servers (I've searched in the supported hardware page but it isn't 
> really clear for me) :
> * HP9000  L2000

yes

> * RP-4440

pa8800 support isn't stable yet.
I have several rp3440-4 boxes setup for developement but we haven't
gotten to the bottom of the sshd segfault (can't ssh into the box).
I believe it's an I-cache flushing issue but haven't had time
to track it further down. Thanks to Randolph/Carlos for getting it that far.
We have determined it's not an I/O coherency issue.

> * RP5430
> * RP5470

Offhand, I'm not sure what these are.
I expect they are later versions of L-class but aren't sure.

> If these servers are supported , can they be used as production servers ?

What does "supported" mean to you?
You have to do your own testing/support on these boxes unless you
want to fund one of the independent developers to do that for you.

FWIW, The most stable recent kernels seem to be 2.6.8.1 (Debian) or
self-built 2.6.10-pa11 (IIRC).

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
