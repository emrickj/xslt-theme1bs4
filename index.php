<?php
// Bootstrap 4 Vertical Button XSLT theme.

ini_set('display_errors', 'On');
error_reporting(E_ALL);

if(isset($_GET['p'])) $p = $_GET['p'];
  else $p="1";

if(isset($_GET['w'])) $w = $_GET['w'];
  else $w="1";

// Load XML file
$xml = new DOMDocument;
$xml->load('data/website.xml');

// Load XSL file
$xsl = new DOMDocument;
$xsl->load('xslt/theme1bs4.xsl');

// Configure the transformer
$proc = new XSLTProcessor;
$proc->setParameter('', 'page', intval($p));
$proc->setParameter('', 'website', intval($w));

// Attach the xsl rules
$proc->importStyleSheet($xsl);

echo $proc->transformToXML($xml);
?>