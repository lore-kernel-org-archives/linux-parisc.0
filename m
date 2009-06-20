From: Kurt Roeckx <kurt@roeckx.be>
Subject: Re: HPPA and Squeeze
Date: Sat, 20 Jun 2009 19:48:38 +0200
Message-ID: <20090620174838.GA22999@roeckx.be>
References: <20090620143347.GA20249@roeckx.be> <20090620160255.440F24EF8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: luk@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090620160255.440F24EF8@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jun 20, 2009 at 12:02:54PM -0400, John David Anglin wrote:
> > On Fri, Jun 19, 2009 at 05:15:26PM +0200, Kurt Roeckx wrote:
> > > So it's my understanding that the porters have no idea about the
> > > problems.  So I will start to mail you about problems as soon
> > > as I see them and they look like porting issues specific
> > > to hppa.
> > 
> > netgen fails to built with an internal compiler error since
> > atleast April 2008.  Logs are at:
> 
> When an internal compiler error occurs as above, a GCC bug report with
> the following information should be filed:
> 
> 1) failing compiler command,
> 2) details of the compiler (gcc -v), and
> 3) the preprocessed source for the failing command.
> 
> You can CC me on hppa bugs (danglin at gcc dot gnu dot org).

I know how to file gcc bugs.  I've just filed one.  I didn't
have time to try and reduce the testcase, and I can't try
different versions of g++ yet.  I've asked to have different
versions installed on paer.

The bug report is at:
http://gcc.gnu.org/PR40505


> It takes less than five minutes to generate the above information and
> file a bug report.

I've never been able to file any (non-automated) bug report in
5 minutes.  And if you don't even have direct access to the
hardware it takes longer.


Kurt

