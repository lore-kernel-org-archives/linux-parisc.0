From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] H40-H50
Date: Fri, 23 Jul 2004 13:31:37 +0100
Message-ID: <20040723123137.GA22927@parcelfarce.linux.theplanet.co.uk>
References: <20040722044237.2ef0b3d6@fork.ketic.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: backblue <backblue@netcabo.pt>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040722044237.2ef0b3d6@fork.ketic.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jul 22, 2004 at 04:42:37AM +0100, backblue wrote:
> Hi, i have a H40 and a H50 rack mounted machines, with mutiple scsi
> array discs, i want to put linux on one of the machines, does one of
> them it's suported here? does any linux suport this?

Not in any useful way, I'm afraid.  We don't support the LAN or SCSI
devices in this machine.  We have support for the console, but that's not
much use to you by itself.  Basically, Linux will boot and could run out
of a ramdisc, but not communicate through anything other than console.
Sorry.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
