From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] Debian Etch RC1 on B180L / X display problem
Date: Fri, 24 Nov 2006 12:51:21 +0000
Message-ID: <20061124125120.GA27596@miranda.arrow>
References: <200611240137.kAO1bAdB000831@stephenson.dhis.org>
	<200611241219.kAOCJD3V002537@stephenson.dhis.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200611241219.kAOCJD3V002537@stephenson.dhis.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Nov 24, 2006 at 01:19:11PM +0100, Jean-Pierre HOFER wrote:

> Sorry, there are not 5 ROWs, but 5 identical COLUMNs.
> 
> Thanks in advance for all hints.

What happens if you put:

    Option "ShadowFB" "false"

in the Device section of xorg.conf?
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
