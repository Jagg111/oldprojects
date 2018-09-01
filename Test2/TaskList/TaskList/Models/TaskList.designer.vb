﻿'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated by a tool.
'     Runtime Version:4.0.30319.261
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On

Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Data
Imports System.Data.Linq
Imports System.Data.Linq.Mapping
Imports System.Linq
Imports System.Linq.Expressions
Imports System.Reflection


<Global.System.Data.Linq.Mapping.DatabaseAttribute(Name:="TaskListDB")>  _
Partial Public Class TaskListDataContext
	Inherits System.Data.Linq.DataContext
	
	Private Shared mappingSource As System.Data.Linq.Mapping.MappingSource = New AttributeMappingSource()
	
  #Region "Extensibility Method Definitions"
  Partial Private Sub OnCreated()
  End Sub
  Partial Private Sub InsertTask(instance As Task)
    End Sub
  Partial Private Sub UpdateTask(instance As Task)
    End Sub
  Partial Private Sub DeleteTask(instance As Task)
    End Sub
  #End Region
	
	Public Sub New()
		MyBase.New(Global.System.Configuration.ConfigurationManager.ConnectionStrings("TaskListDBConnectionString").ConnectionString, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As String)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As System.Data.IDbConnection)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As String, ByVal mappingSource As System.Data.Linq.Mapping.MappingSource)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As System.Data.IDbConnection, ByVal mappingSource As System.Data.Linq.Mapping.MappingSource)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public ReadOnly Property Tasks() As System.Data.Linq.Table(Of Task)
		Get
			Return Me.GetTable(Of Task)
		End Get
	End Property
End Class

<Global.System.Data.Linq.Mapping.TableAttribute(Name:="dbo.Tasks")>  _
Partial Public Class Task
	Implements System.ComponentModel.INotifyPropertyChanging, System.ComponentModel.INotifyPropertyChanged
	
	Private Shared emptyChangingEventArgs As PropertyChangingEventArgs = New PropertyChangingEventArgs(String.Empty)
	
	Private _Id As Integer
	
	Private _Task As String
	
	Private _IsCompleted As Boolean
	
	Private _EntryDate As Date
	
    #Region "Extensibility Method Definitions"
    Partial Private Sub OnLoaded()
    End Sub
    Partial Private Sub OnValidate(action As System.Data.Linq.ChangeAction)
    End Sub
    Partial Private Sub OnCreated()
    End Sub
    Partial Private Sub OnIdChanging(value As Integer)
    End Sub
    Partial Private Sub OnIdChanged()
    End Sub
    Partial Private Sub OnTaskChanging(value As String)
    End Sub
    Partial Private Sub OnTaskChanged()
    End Sub
    Partial Private Sub OnIsCompletedChanging(value As Boolean)
    End Sub
    Partial Private Sub OnIsCompletedChanged()
    End Sub
    Partial Private Sub OnEntryDateChanging(value As Date)
    End Sub
    Partial Private Sub OnEntryDateChanged()
    End Sub
    #End Region
	
	Public Sub New()
		MyBase.New
		OnCreated
	End Sub
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_Id", AutoSync:=AutoSync.OnInsert, DbType:="Int NOT NULL IDENTITY", IsPrimaryKey:=true, IsDbGenerated:=true)>  _
	Public Property Id() As Integer
		Get
			Return Me._Id
		End Get
		Set
			If ((Me._Id = value)  _
						= false) Then
				Me.OnIdChanging(value)
				Me.SendPropertyChanging
				Me._Id = value
				Me.SendPropertyChanged("Id")
				Me.OnIdChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_Task", DbType:="NVarChar(300) NOT NULL", CanBeNull:=false)>  _
	Public Property Task() As String
		Get
			Return Me._Task
		End Get
		Set
			If (String.Equals(Me._Task, value) = false) Then
				Me.OnTaskChanging(value)
				Me.SendPropertyChanging
				Me._Task = value
				Me.SendPropertyChanged("Task")
				Me.OnTaskChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_IsCompleted", DbType:="Bit NOT NULL")>  _
	Public Property IsCompleted() As Boolean
		Get
			Return Me._IsCompleted
		End Get
		Set
			If ((Me._IsCompleted = value)  _
						= false) Then
				Me.OnIsCompletedChanging(value)
				Me.SendPropertyChanging
				Me._IsCompleted = value
				Me.SendPropertyChanged("IsCompleted")
				Me.OnIsCompletedChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_EntryDate", DbType:="DateTime NOT NULL")>  _
	Public Property EntryDate() As Date
		Get
			Return Me._EntryDate
		End Get
		Set
			If ((Me._EntryDate = value)  _
						= false) Then
				Me.OnEntryDateChanging(value)
				Me.SendPropertyChanging
				Me._EntryDate = value
				Me.SendPropertyChanged("EntryDate")
				Me.OnEntryDateChanged
			End If
		End Set
	End Property
	
	Public Event PropertyChanging As PropertyChangingEventHandler Implements System.ComponentModel.INotifyPropertyChanging.PropertyChanging
	
	Public Event PropertyChanged As PropertyChangedEventHandler Implements System.ComponentModel.INotifyPropertyChanged.PropertyChanged
	
	Protected Overridable Sub SendPropertyChanging()
		If ((Me.PropertyChangingEvent Is Nothing)  _
					= false) Then
			RaiseEvent PropertyChanging(Me, emptyChangingEventArgs)
		End If
	End Sub
	
	Protected Overridable Sub SendPropertyChanged(ByVal propertyName As [String])
		If ((Me.PropertyChangedEvent Is Nothing)  _
					= false) Then
			RaiseEvent PropertyChanged(Me, New PropertyChangedEventArgs(propertyName))
		End If
	End Sub
End Class