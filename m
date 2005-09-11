From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] New libc6 2.3.5-6: poll timeouts
Date: Sun, 11 Sep 2005 15:34:46 -0500
Message-ID: <1126470886.4831.25.camel@mulgrave>
References: <200509111818.j8BIIu7a026195@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200509111818.j8BIIu7a026195@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2005-09-11 at 14:18 -0400, John David Anglin wrote:
> > Lamont is supposed to be arranging a binNMU of libc6 compiled with
> > gcc-3.3.5, but temporarily you can just force install libc6 from stable.
> 
> If I try to do this with apt-get, it will remove half the packages on
> the system.  So, either I have to manually downgrade with dpkg or wait
> for Lamont.

You do it like this

apt-get -d install libc6/stable

which will download but not install it

then

dpkg -i /var/cache/apt/archive/libc6-<version>.deb

which will install it ignoring all of apt's dependencies

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
