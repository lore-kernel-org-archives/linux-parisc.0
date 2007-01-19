From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Broken scheduler?
Date: Fri, 19 Jan 2007 00:11:09 -0700
Message-ID: <20070119071109.GB14240__25896.5381690816$1416624266$gmane$org@colo.lackof.org>
References: <7d01f9f00701160400n4d3c3343rb864e765eb4423f9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00701160400n4d3c3343rb864e765eb4423f9@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jan 16, 2007 at 01:00:22PM +0100, Thibaut VARENE wrote:
> See how only the first CPU gets used, and how the 4 instances of
> setiathome share 25% cpu each...

Yup...that's the same bug I report on Jan 10, 2007.

> That's with git head (+ tausq's cache patch + kyle's sysinfo patch +
> e5e5673f828623e58a401862b33173591faaeaff reverted)

I believe mine was with 2.6.20-rc2 kernel. I know scheduling works
with the 2.6.17-pa6 kernel (on gsyprf11) but haven't checked what the
behavior is for kernels between...I wanted to do that already but
have been too busy lately.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
