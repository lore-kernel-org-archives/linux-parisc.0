From: ram <talk2ram@gmail.com>
Subject: Re: [parisc-linux] Fwd: problem installing Debian on HP R class 9000
Date: Mon, 26 Feb 2007 23:20:50 +0530
Message-ID: <b74751490702260950i6ed5ef98g219297ad504672fb__8650.40304274789$1416624318$gmane$org@mail.gmail.com>
References: <b74751490702220323o3b3d78a9u14b024a75341c986@mail.gmail.com>
	<b74751490702260642i4b1a2538rd384e280e0a24622@mail.gmail.com>
	<20070226165018.GB30763@colo.lackof.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0738041406=="
Cc: parisc-linux@lists.parisc-linux.org
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070226165018.GB30763@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============0738041406==
Content-Type: multipart/alternative;
	boundary="----=_Part_85_20492750.1172512250097"

------=_Part_85_20492750.1172512250097
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2/26/07, Grant Grundler <grundler@parisc-linux.org> wrote:
>
> On Mon, Feb 26, 2007 at 08:12:55PM +0530, ram wrote:
> > Kernel Panic- not syncing:drivers/parisc/ccio-dma.c: ccio_alloc_range()
> I/O
> > MMU is out of mapping resources
>
> Yeah, this is a known problem. Current workaround is to hack the
> ccio driver to increase the minimum amount of IOVA space allocated.
>
> We need to make this a kernel parameter.



Hi

thanks for the quick reply
can you suggest me some document
how can i hack the code make my HP R class work with debian

any suggestions or readings

ram

------=_Part_85_20492750.1172512250097
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<br><br>
<div><span class="gmail_quote">On 2/26/07, <b class="gmail_sendername">Grant Grundler</b> &lt;<a href="mailto:grundler@parisc-linux.org">grundler@parisc-linux.org</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">On Mon, Feb 26, 2007 at 08:12:55PM +0530, ram wrote:<br>&gt; Kernel Panic- not syncing:drivers/parisc/ccio-
dma.c: ccio_alloc_range() I/O<br>&gt; MMU is out of mapping resources<br><br>Yeah, this is a known problem. Current workaround is to hack the<br>ccio driver to increase the minimum amount of IOVA space allocated.<br><br>We need to make this a kernel parameter.
</blockquote>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Hi</div>
<div>&nbsp;</div>
<div>thanks for the quick reply</div>
<div>can you suggest me some document </div>
<div>how can i hack the code make my HP R class work with debian</div>
<div>&nbsp;</div>
<div>any suggestions or readings</div>
<div>&nbsp;</div>
<div>ram<br>&nbsp;</div></div><br>

------=_Part_85_20492750.1172512250097--

--===============0738041406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0738041406==--
