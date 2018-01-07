<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="rep_Registro.aspx.cs" Inherits="SisMatricula_cSharp_v2.rep_Registro" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
            <h5>Reporte Registro</h5>
          </div>
          <div class="widget-content nopadding" style="background-color:white;">
               <rsweb:ReportViewer ID="repRegistro" runat="server" Width="1169px"></rsweb:ReportViewer>
          </div>
        </div>
      </div>
</asp:Content>
